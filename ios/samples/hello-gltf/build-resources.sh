#/usr/bin/env/bash

set -e

# Compile resources.

# The hello-gltf app requires two resources:
# 1. The IBL image
# 2. The skybox image
# These will be compiled into the final binary via the resgen tool.

HOST_TOOLS_PATH="${HOST_TOOLS_PATH:-../../../out/release/filament/bin}"

resgen_path=`find ${HOST_TOOLS_PATH} -name resgen -type f | head -n 1`
cmgen_path=`find ${HOST_TOOLS_PATH} -name cmgen -type f | head -n 1`

# Ensure that the required tools are present in the out/ directory.
# These can be built by running ./build.sh -p desktop -i release at Filament's root directory.

if [[ ! -e "${resgen_path}" ]]; then
  echo "No resgen binary could be found in ${HOST_TOOLS_PATH}."
  echo "Ensure Filament has been built/installed before building this app."
  exit 1
fi

if [[ ! -e "${cmgen_path}" ]]; then
  echo "No cmgen binary could be found in ${HOST_TOOLS_PATH}."
  echo "Ensure Filament has been built/installed before building this app."
  exit 1
fi

# cmgen consumes an HDR environment map and generates two mipmapped KTX files (IBL and skybox)
"${cmgen_path}" \
    --quiet \
    --deploy="${PROJECT_DIR}/generated/venetian_crossroads_2k" \
    --format=ktx --size=256 --extract-blur=0.1 \
    "${PROJECT_DIR}/../../../third_party/environments/venetian_crossroads_2k.hdr"

# The resgen tool generates an assembly file, resources.apple.S that gets compiled and linked
# into the final binary. It contains all the resources consumed by the app.
"${resgen_path}" \
    --deploy="${PROJECT_DIR}/generated" \
    "${PROJECT_DIR}/generated/venetian_crossroads_2k/venetian_crossroads_2k_skybox.ktx" \
    "${PROJECT_DIR}/generated/venetian_crossroads_2k/venetian_crossroads_2k_ibl.ktx"

# App.cpp and Resources.S include files generated by resgen.
# Touch them to force Xcode to recompile.
touch "${PROJECT_DIR}/hello-gltf/FilamentView/App.cpp"
touch "${PROJECT_DIR}/hello-gltf/SupportFiles/Resources.S"
