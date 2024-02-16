package com.example.gpsbeacon;

import android.app.Service;
import android.content.Intent;
import android.content.pm.PackageManager;
import android.location.Location;
import android.location.LocationListener;
import android.location.LocationManager;
import android.os.IBinder;
import android.provider.Settings;
import android.util.Log;
import android.widget.Toast;

import androidx.annotation.NonNull;
import androidx.annotation.Nullable;
import androidx.core.app.ActivityCompat;

import com.google.android.gms.location.FusedLocationProviderClient;
import com.google.android.gms.location.LocationServices;
import com.google.android.gms.tasks.OnSuccessListener;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.nio.charset.StandardCharsets;

public class ServiceBeacon extends Service implements LocationListener {
    public double latitude = 0;
    public double longitude = 0;
    private String deviceID;
    private LocationManager locationManager;
    private Location gps_loc = null;
    private FusedLocationProviderClient fusedLocationClient;

    private static String parse_device_data(String deviceId, double latitude, double longitude) {
        String data_parsed;
        data_parsed = deviceId + ":" + latitude + ":" + longitude;
        Log.d("data", data_parsed);
        return data_parsed;
    }


    @Override
    public void onCreate() {
        super.onCreate();
        //begins here
        deviceID = getDeviceID();
        try {
            sendPOST(latitude, longitude, deviceID);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
        Log.d("Service", "Started Service");
        //Toast.makeText(this, "Starting service", Toast.LENGTH_LONG).show();
        if (ActivityCompat.checkSelfPermission(getApplicationContext(), android.Manifest.permission.ACCESS_FINE_LOCATION) != PackageManager.PERMISSION_GRANTED && ActivityCompat.checkSelfPermission(this, android.Manifest.permission.ACCESS_COARSE_LOCATION) != PackageManager.PERMISSION_GRANTED) {
            Toast.makeText(getApplicationContext(), "Need permissions", Toast.LENGTH_LONG).show();
        } else {
            locationManager = (LocationManager) getApplicationContext().getSystemService(LOCATION_SERVICE);
            locationManager.requestLocationUpdates(LocationManager.GPS_PROVIDER, 10000, 1, this::onLocationChanged);
        }
    }

    @Override
    public int onStartCommand(Intent intent, int flags, int startId) {

        // We want this service to continue running until it is explicitly
        // stopped, so return sticky.

        return START_STICKY;
    }


    private String getDeviceID() {
        deviceID = Settings.Secure.getString(this.getContentResolver(), Settings.Secure.ANDROID_ID);
        return deviceID;
    }

    private void updateGPSCoords(Location location) {
        if (location != null) {
            latitude = location.getLatitude();
            longitude = location.getLongitude();
        }
    }

    private void sendPOST(double latitude, double longitude, String deviceID) throws IOException {
        Thread post_thread = new Thread() {
            @Override
            public void run() {
                try {
                    String url = "http://mamut.nsupdate.info:8088";
                    String jsonInputString = parse_device_data(deviceID, latitude, longitude);
                    URL urlObj = new URL(url);
                    HttpURLConnection conn = (HttpURLConnection) urlObj.openConnection();
                    conn.setDoOutput(true);
                    conn.setRequestMethod("POST");
                    conn.setRequestProperty("Accept-Charset", "UTF-8");
                    conn.setRequestProperty("Accept", "application/json");
                    try (OutputStream os = conn.getOutputStream()) {
                        byte[] input = jsonInputString.getBytes(StandardCharsets.UTF_8);
                        os.write(input, 0, input.length);
                    }
                    try (BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream(), StandardCharsets.UTF_8))) {
                        StringBuilder response = new StringBuilder();
                        String responseLine = null;
                        while ((responseLine = br.readLine()) != null) {
                            response.append(responseLine.trim());
                        }
                        Log.d("response", response.toString());
                    }
                } catch (IOException e) {
                    Log.d("error", e.toString());
                }
            }
        };
        post_thread.start();
        Toast.makeText(getApplicationContext(), "post send", Toast.LENGTH_SHORT).show();
    }

    @Override
    public void onLocationChanged(@NonNull Location location) {
        String location_changed_text = "Location changed";
        Toast.makeText(getApplicationContext(), location_changed_text, Toast.LENGTH_SHORT).show();
        updateGPSCoords(location);
        try {
            sendPOST(latitude, longitude, deviceID);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }

    }

    @Override
    public void onDestroy() {
        super.onDestroy();
        Toast.makeText(this, "Service Destroyed", Toast.LENGTH_LONG).show();
    }

    @Nullable
    @Override
    public IBinder onBind(Intent intent) {
        return null;
    }

}
