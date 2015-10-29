<?xml version="1.0" encoding="utf-8"?>
<LinearLayout xmlns:android="http://schemas.android.com/apk/res/android"
              android:orientation="horizontal"
              android:layout_width="match_parent"
              android:layout_height="match_parent"
              android:descendantFocusability="blocksDescendants">

    <ImageView
        android:id="@+id/example_image"
        android:layout_width="wrap_content"
        android:layout_height="wrap_content"
        android:src="@mipmap/ic_launcher"
        />

    <TextView
        android:id="@+id/example_text"
        android:layout_width="0dp"
        android:layout_height="wrap_content"
        android:layout_weight="1"
        android:layout_gravity="center"
        android:layout_marginLeft="2dp"
        android:gravity="center"
        android:text="This is text!"
        />

    <Button
        android:id="@+id/example_button"
        android:layout_width="wrap_content"
        android:layout_height="wrap_content"
        android:layout_gravity="center"
        android:layout_margin="5dp"
        android:text="Back"
        android:textColor="#fff"/>

</LinearLayout>