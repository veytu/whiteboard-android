# ===========================================
# Whiteboard SDK ProGuard Rules
# 白板SDK保护规则
# ===========================================

# ===========================================
# 基础Android保护规则
# ===========================================

# 保护应用入口点
-keep public class * extends android.app.Application
-keep public class * extends android.app.Activity
-keep public class * extends android.app.Service
-keep public class * extends android.content.BroadcastReceiver
-keep public class * extends android.content.ContentProvider

# 保护View相关方法
-keepclassmembers class * extends android.view.View {
    public <init>(android.content.Context);
    public <init>(android.content.Context, android.util.AttributeSet);
    public <init>(android.content.Context, android.util.AttributeSet, int);
    public void set*(***);
    *** get*();
}

# 保护Parcelable序列化类
-keep class * implements android.os.Parcelable {
    public static final android.os.Parcelable$Creator *;
}

# 保护Serializable序列化类
-keepclassmembers class * implements java.io.Serializable {
    static final long serialVersionUID;
    private static final java.io.ObjectStreamField[] serialPersistentFields;
    private void writeObject(java.io.ObjectOutputStream);
    private void readObject(java.io.ObjectInputStream);
    java.lang.Object writeReplace();
    java.lang.Object readResolve();
}

# 保护R文件
-keepclassmembers class **.R$* {
    public static <fields>;
}

# 保护Native方法
-keepclasseswithmembernames class * {
    native <methods>;
}

# 保护注解
-keepattributes *Annotation*, Signature, InnerClasses, EnclosingMethod
-keepattributes RuntimeVisibleAnnotations, RuntimeVisibleParameterAnnotations

# ===========================================
# AndroidX 相关保护规则
# ===========================================

# AndroidX Core
-keep class androidx.core.** { *; }
-keep class androidx.versionedparcelable.** { *; }

# AppCompat
-keep public class androidx.appcompat.** { *; }
-keep public class androidx.appcompat.resources.** { *; }

# Material Design
-keep class com.google.android.material.** { *; }
-keep interface com.google.android.material.** { *; }

# ConstraintLayout
-keep class androidx.constraintlayout.** { *; }

# Legacy Support
-keep class androidx.legacy.** { *; }

# Activity
-keep class androidx.activity.** { *; }

# ===========================================
# Kotlin 相关保护规则
# ===========================================

# 保护Kotlin元数据
-keep class kotlin.** { *; }
-keep class kotlinx.** { *; }
-dontwarn kotlin.**
-dontwarn kotlinx.**

# 保护协程相关类
-keep class kotlinx.coroutines.** { *; }
-dontwarn kotlinx.coroutines.**

# 保护Kotlin接口的默认实现类
-keepclassmembers class *$$DefaultImpls { *; }

# ===========================================
# HereWhite 白板SDK保护规则
# ===========================================

# 保护白板SDK核心类
-keep class com.herewhite.sdk.** { *; }
-keep class com.herewhite.sdk.domain.** { *; }

# 保护白板相关的所有类
-keep class com.herewhite.** { *; }

# 保护白板WebView相关类
-keepclassmembers class * {
    @android.webkit.JavascriptInterface <methods>;
}

# 保护白板配置类
-keep class com.herewhite.sdk.domain.WhiteObject { *; }
-keep class com.herewhite.sdk.domain.WindowAppParam { *; }
-keep class com.herewhite.sdk.domain.WindowPrefersColorScheme { *; }

# 保护白板参数类
-keep class com.herewhite.sdk.domain.WindowAppParam$** { *; }
-keep class com.herewhite.sdk.domain.WindowPrefersColorScheme$** { *; }

# ===========================================
# 网络库保护规则 (Gson + OkHttp)
# ===========================================

# Gson
-keep class com.google.gson.** { *; }
-keep class * implements com.google.gson.TypeAdapterFactory
-keep class * implements com.google.gson.JsonSerializer
-keep class * implements com.google.gson.JsonDeserializer
-keepclassmembers,allowobfuscation class * {
  @com.google.gson.annotations.SerializedName <fields>;
}

# OkHttp
-keep class okhttp3.** { *; }
-keep interface okhttp3.** { *; }
-keep class okio.** { *; }
-dontwarn okhttp3.**
-dontwarn okio.**
-dontwarn javax.annotation.**

# ===========================================
# 第三方库保护规则
# ===========================================

# DSBridge (JavaScript Bridge)
-keep class com.github.dsbridge.** { *; }

# 保护注解相关的类
-keep class androidx.annotation.** { *; }

# ===========================================
# WebView和JavaScript接口保护规则
# ===========================================

# 保护WebView相关类
-keep class * extends android.webkit.WebViewClient
-keep class * extends android.webkit.WebChromeClient

# 保护JavaScript接口
-keepclassmembers class * {
    @android.webkit.JavascriptInterface public *;
}

# 保护WebView JavaScript接口
-keepclassmembers class * {
    @android.webkit.JavascriptInterface <methods>;
}

# ===========================================
# 优化建议
# ===========================================

# 移除日志调用（发布版本）
-assumenosideeffects class android.util.Log {
    public static boolean isLoggable(java.lang.String, int);
    public static int v(...);
    public static int i(...);
    public static int w(...);
    public static int d(...);
    public static int e(...);
}

# ===========================================
# 警告抑制
# ===========================================

# 抑制白板SDK相关警告
-dontwarn com.herewhite.**
-dontwarn com.github.dsbridge.**

# 抑制第三方库的警告
-dontwarn com.google.gson.**
-dontwarn okhttp3.**
-dontwarn okio.**

# 抑制系统相关警告
-dontwarn java.lang.invoke.StringConcatFactory
-dontwarn sun.nio.ch.DirectBuffer

# ===========================================
# 其他重要保护规则
# ===========================================

# 保护枚举类
-keepclassmembers enum * {
    public static **[] values();
    public static ** valueOf(java.lang.String);
}

# 保护内部类
-keepclassmembers class * {
    static class *;
}

# 保护泛型签名
-keepattributes Signature

# 保护异常信息
-keepattributes Exceptions

# 保护行号信息（用于调试）
-keepattributes SourceFile,LineNumberTable

# 保护本地变量名（用于调试）
-keepattributes LocalVariableTable

# 保护JVM静态方法
-keepclassmembers class * {
    @kotlin.jvm.JvmStatic <methods>;
    @kotlin.jvm.JvmField <fields>;
}