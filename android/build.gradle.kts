allprojects {
    repositories {
        google()
        mavenCentral()
    }
}

val newBuildDir: Directory =
    rootProject.layout.buildDirectory
        .dir("../../build")
        .get()
rootProject.layout.buildDirectory.value(newBuildDir)

subprojects {
    val newSubprojectBuildDir: Directory = newBuildDir.dir(project.name)
    project.layout.buildDirectory.value(newSubprojectBuildDir)
}
subprojects {
    project.evaluationDependsOn(":app")
}

subprojects {
    val configureSplash = {
        if (name == "flutter_native_splash") {
            extensions.findByType(com.android.build.api.dsl.LibraryExtension::class.java)
                ?.compileSdk = 36
        }
    }
    if (project.state.executed) {
        configureSplash()
    } else {
        afterEvaluate { configureSplash() }
    }
}

tasks.register<Delete>("clean") {
    delete(rootProject.layout.buildDirectory)
}
