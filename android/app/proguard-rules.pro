## Flutter wrapper
-keep class io.flutter.app.** { *; }
-keep class io.flutter.plugin.**  { *; }
-keep class io.flutter.util.**  { *; }
-keep class io.flutter.view.**  { *; }
-keep class io.flutter.**  { *; }
-keep class io.flutter.plugins.**  { *; }
-dontwarn io.flutter.embedding.**

## Firebase
-keep class com.google.firebase.** { *; }
-keep class com.google.android.gms.** { *; }
-dontwarn com.google.firebase.**
-dontwarn com.google.android.gms.**

## Firebase Remote Config
-keep class com.google.firebase.remoteconfig.** { *; }
-keepclassmembers class com.google.firebase.remoteconfig.** { *; }

## Firebase Analytics
-keep class com.google.firebase.analytics.** { *; }
-keepclassmembers class com.google.firebase.analytics.** { *; }

## OneSignal
-keep class com.onesignal.** { *; }
-keep interface com.onesignal.** { *; }
-dontwarn com.onesignal.**

## Gson (used by various plugins)
-keepattributes Signature
-keepattributes *Annotation*
-dontwarn sun.misc.**
-keep class com.google.gson.** { *; }
-keep class * implements com.google.gson.TypeAdapterFactory
-keep class * implements com.google.gson.JsonSerializer
-keep class * implements com.google.gson.JsonDeserializer

## Keep native methods
-keepclasseswithmembernames class * {
    native <methods>;
}

## SQLite
-keep class org.sqlite.** { *; }
-keep class org.sqlite.database.** { *; }

## Supabase (Kotlin serialization)
-keepattributes *Annotation*, InnerClasses
-dontnote kotlinx.serialization.AnnotationsKt
-keepclassmembers class kotlinx.serialization.json.** {
    *** Companion;
}
-keepclasseswithmembers class kotlinx.serialization.json.** {
    kotlinx.serialization.KSerializer serializer(...);
}
-keep,includedescriptorclasses class io.github.jan.supabase.**$$serializer { *; }
-keepclassmembers class io.github.jan.supabase.** {
    *** Companion;
}
-keepclasseswithmembers class io.github.jan.supabase.** {
    kotlinx.serialization.KSerializer serializer(...);
}

## Keep generic signatures
-keepattributes Signature
-keepattributes Exceptions
-keepattributes InnerClasses
-keepattributes EnclosingMethod

## Package Info Plus
-keep class android.content.pm.** { *; }

## Device Info Plus
-keep class android.os.Build { *; }
-keep class android.os.Build$VERSION { *; }

## Shared Preferences
-keep class android.content.SharedPreferences { *; }
-keep class android.content.SharedPreferences$** { *; }
