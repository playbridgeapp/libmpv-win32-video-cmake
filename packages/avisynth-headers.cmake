ExternalProject_Add(avisynth-headers
    URL https://github.com/AviSynth/AviSynthPlus/archive/1ffeb08c726b2af5448225ad27686248e68f2645.tar.gz
    URL_HASH SHA256=479dd05e18e42d3c0b53590d7cfb98c84830ac6d9ae1bca94f2bf7cf01f2ecae
    DOWNLOAD_DIR ${SOURCE_LOCATION}
    SOURCE_DIR ${SOURCE_LOCATION}/avisynth-headers
    UPDATE_COMMAND ""
    CONFIGURE_COMMAND ${EXEC} CONF=1 cmake -H<SOURCE_DIR>/avisynth-headers -B<BINARY_DIR>
        -G Ninja
        -DCMAKE_BUILD_TYPE=Release
        -DCMAKE_TOOLCHAIN_FILE=${TOOLCHAIN_FILE}
        -DCMAKE_INSTALL_PREFIX=${MINGW_INSTALL_PREFIX}
        -DCMAKE_FIND_ROOT_PATH=${MINGW_INSTALL_PREFIX}
        -DBUILD_SHARED_LIBS=OFF
        -DHEADERS_ONLY=ON
    BUILD_COMMAND ${EXEC} ninja -C <BINARY_DIR> VersionGen
    INSTALL_COMMAND ${EXEC} ninja -C <BINARY_DIR> install
    LOG_DOWNLOAD 1 LOG_UPDATE 1 LOG_CONFIGURE 1 LOG_BUILD 1 LOG_INSTALL 1
)
cleanup(avisynth-headers install)
