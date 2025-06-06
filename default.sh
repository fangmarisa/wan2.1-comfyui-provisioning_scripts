#!/bin/bash

source /venv/main/bin/activate
COMFYUI_DIR=${WORKSPACE}/ComfyUI

# Packages are installed after nodes so we can fix them...

APT_PACKAGES=(
    #"package-1"
    #"package-2"
)

PIP_PACKAGES=(
    #"package-1"
    #"package-2"
)

NODES=(
    "https://github.com/ltdrdata/ComfyUI-Manager.git"
    "https://github.com/cubiq/ComfyUI_essentials.git"
    "https://github.com/pythongosssss/ComfyUI-Custom-Scripts.git"
    "https://github.com/city96/ComfyUI-GGUF.git"
    "https://github.com/kijai/ComfyUI-KJNodes.git"
    "https://github.com/Kosinkadink/ComfyUI-VideoHelperSuite.git"
    "https://github.com/Smirnov75/ComfyUI-mxToolkit.git"
    "https://github.com/facok/ComfyUI-HunyuanVideoMultiLora.git"
    "https://github.com/rgthree/rgthree-comfy.git"
    "https://github.com/Fannovel16/ComfyUI-Frame-Interpolation.git"
    "https://github.com/WASasquatch/was-node-suite-comfyui.git"
    "https://github.com/kijai/ComfyUI-Florence2.git"
    "https://github.com/yuvraj108c/ComfyUI-Upscaler-Tensorrt.git"
    "https://github.com/pollockjj/ComfyUI-MultiGPU.git"
    "https://github.com/yolain/ComfyUI-Easy-Use.git"
    "https://github.com/MohammadAboulEla/ComfyUI-iTools.git"
    "https://github.com/ltdrdata/ComfyUI-Inspire-Pack.git"
    "https://github.com/crystian/ComfyUI-Crystools.git"
)

WORKFLOWS=(

)

CHECKPOINT_MODELS=(
)    

UNET_MODELS=(
)

LORA_MODELS=(
)

VAE_MODELS=(
)

ESRGAN_MODELS=(
)

CONTROLNET_MODELS=(
)
         #"https://huggingface.co/UmeAiRT/ComfyUI-Auto_installer/resolve/main/models/unet/WAN/wan2.1-i2v-14b-480p-Q8_0.gguf"
         #"https://huggingface.co/UmeAiRT/ComfyUI-Auto_installer/resolve/main/models/unet/WAN/wan2.1-i2v-720p-Q8_0.gguf"
        #"https://huggingface.co/UmeAiRT/ComfyUI-Auto_installer/resolve/main/models/diffusion_models/WAN/wan2.1_i2v_720p_14B_fp8_e4m3fn.safetensors"
        #"https://huggingface.co/UmeAiRT/ComfyUI-Auto_installer/resolve/main/models/diffusion_models/WAN/wan2.1_i2v_480p_14B_fp8_e4m3fn.safetensors"
DIFFUSION_MODELS=(
        "https://huggingface.co/UmeAiRT/ComfyUI-Auto_installer/resolve/main/models/unet/WAN/wan2.1-i2v-14b-480p-Q3_K_S.gguf"
        #"https://huggingface.co/UmeAiRT/ComfyUI-Auto_installer/resolve/main/models/unet/WAN/wan2.1-i2v-14b-480p-Q5_K_M.gguf"
        #"https://huggingface.co/UmeAiRT/ComfyUI-Auto_installer/resolve/main/models/unet/WAN/wan2.1-i2v-720p-Q3_K_S.gguf"
       #"https://huggingface.co/UmeAiRT/ComfyUI-Auto_installer/resolve/main/models/unet/WAN/wan2.1-i2v-720p-Q5_K_M.gguf"
)
#"https://huggingface.co/UmeAiRT/ComfyUI-Auto_installer/resolve/main/models/clip/umt5-xxl-encoder-Q8_0.gguf"
    #"https://huggingface.co/Comfy-Org/Wan_2.1_ComfyUI_repackaged/resolve/main/split_files/text_encoders/umt5_xxl_fp8_e4m3fn_scaled.safetensors"
CLIP_MODELS=(
    "https://huggingface.co/UmeAiRT/ComfyUI-Auto_installer/resolve/main/models/clip/umt5-xxl-encoder-Q3_K_S.gguf"
    "https://huggingface.co/UmeAiRT/ComfyUI-Auto_installer/resolve/main/models/clip/umt5-xxl-encoder-Q5_K_M.gguf"
)

CLIP_VISION_MODELS=(
    "https://huggingface.co/Comfy-Org/Wan_2.1_ComfyUI_repackaged/resolve/main/split_files/clip_vision/clip_vision_h.safetensors"
)

VAE_MODELS=("https://huggingface.co/Comfy-Org/Wan_2.1_ComfyUI_repackaged/resolve/main/split_files/vae/wan_2.1_vae.safetensors")
UPSCALE_MODELS=()
### DO NOT EDIT BELOW HERE UNLESS YOU KNOW WHAT YOU ARE DOING ###

function provisioning_start() {
    provisioning_print_header
    provisioning_get_apt_packages
    provisioning_get_nodes
    provisioning_get_pip_packages
    provisioning_get_files "${COMFYUI_DIR}/models/clip"\
      "${CLIP_MODELS[@]}"
    provisioning_get_files "${COMFYUI_DIR}/models/diffusion_models"\
      "${DIFFUSION_MODELS[@]}"
    provisioning_get_files "${COMFYUI_DIR}/models/clip_vision" \
       "${CLIP_VISION_MODELS[@]}"
    provisioning_get_files "${COMFYUI_DIR}/models/text_encoders" \
       "${TEXT_ENCODER_MODELS[@]}"
    provisioning_get_files "${COMFYUI_DIR}/models/upscale_models" \
      "${UPSCALE_MODELS[@]}"
    provisioning_get_files "${COMFYUI_DIR}/models/vae" \
     "${VAE_MODELS[@]}"
    provisioning_get_files \
        "${COMFYUI_DIR}/models/checkpoints" \
        "${CHECKPOINT_MODELS[@]}"
    provisioning_get_files \
        "${COMFYUI_DIR}/models/unet" \
        "${UNET_MODELS[@]}"
    provisioning_get_files \
        "${COMFYUI_DIR}/models/lora" \
        "${LORA_MODELS[@]}"
    provisioning_get_files \
        "${COMFYUI_DIR}/models/controlnet" \
        "${CONTROLNET_MODELS[@]}"
    provisioning_get_files \
        "${COMFYUI_DIR}/models/vae" \
        "${VAE_MODELS[@]}"
    provisioning_get_files \
        "${COMFYUI_DIR}/models/esrgan" \
        "${ESRGAN_MODELS[@]}"
    provisioning_print_end
}

function provisioning_get_apt_packages() {
    if [[ -n $APT_PACKAGES ]]; then
            sudo $APT_INSTALL ${APT_PACKAGES[@]}
    fi
}

function provisioning_get_pip_packages() {
    if [[ -n $PIP_PACKAGES ]]; then
            pip install --no-cache-dir ${PIP_PACKAGES[@]}
    fi
}

function provisioning_get_nodes() {
    for repo in "${NODES[@]}"; do
        dir="${repo##*/}"
        path="${COMFYUI_DIR}/custom_nodes/${dir}"
        requirements="${path}/requirements.txt"
        if [[ -d $path ]]; then
            if [[ ${AUTO_UPDATE,,} != "false" ]]; then
                printf "Updating node: %s...\n" "${repo}"
                ( cd "$path" && git pull )
                if [[ -e $requirements ]]; then
                   pip install --no-cache-dir -r "$requirements"
                fi
            fi
        else
            printf "Downloading node: %s...\n" "${repo}"
            git clone "${repo}" "${path}" --recursive
            if [[ -e $requirements ]]; then
                pip install --no-cache-dir -r "${requirements}"
            fi
        fi
    done
}

function provisioning_get_files() {
    if [[ -z $2 ]]; then return 1; fi
    
    dir="$1"
    mkdir -p "$dir"
    shift
    arr=("$@")
    printf "Downloading %s model(s) to %s...\n" "${#arr[@]}" "$dir"
    for url in "${arr[@]}"; do
        printf "Downloading: %s\n" "${url}"
        provisioning_download "${url}" "${dir}"
        printf "\n"
    done
}

function provisioning_print_header() {
    printf "\n##############################################\n#                                            #\n#          Provisioning container            #\n#                                            #\n#         This will take some time           #\n#                                            #\n# Your container will be ready on completion #\n#                                            #\n##############################################\n\n"
}

function provisioning_print_end() {
    printf "\nProvisioning complete:  Application will start now\n\n"
}

function provisioning_has_valid_hf_token() {
    [[ -n "$HF_TOKEN" ]] || return 1
    url="https://huggingface.co/api/whoami-v2"

    response=$(curl -o /dev/null -s -w "%{http_code}" -X GET "$url" \
        -H "Authorization: Bearer $HF_TOKEN" \
        -H "Content-Type: application/json")

    # Check if the token is valid
    if [ "$response" -eq 200 ]; then
        return 0
    else
        return 1
    fi
}

function provisioning_has_valid_civitai_token() {
    [[ -n "$CIVITAI_TOKEN" ]] || return 1
    url="https://civitai.com/api/v1/models?hidden=1&limit=1"

    response=$(curl -o /dev/null -s -w "%{http_code}" -X GET "$url" \
        -H "Authorization: Bearer $CIVITAI_TOKEN" \
        -H "Content-Type: application/json")

    # Check if the token is valid
    if [ "$response" -eq 200 ]; then
        return 0
    else
        return 1
    fi
}

# Download from $1 URL to $2 file path
function provisioning_download() {
    if [[ -n $HF_TOKEN && $1 =~ ^https://([a-zA-Z0-9_-]+\.)?huggingface\.co(/|$|\?) ]]; then
        auth_token="$HF_TOKEN"
    elif 
        [[ -n $CIVITAI_TOKEN && $1 =~ ^https://([a-zA-Z0-9_-]+\.)?civitai\.com(/|$|\?) ]]; then
        auth_token="$CIVITAI_TOKEN"
    fi
    if [[ -n $auth_token ]];then
        wget --header="Authorization: Bearer $auth_token" -qnc --content-disposition --show-progress -e dotbytes="${3:-4M}" -P "$2" "$1"
    else
        wget -qnc --content-disposition --show-progress -e dotbytes="${3:-4M}" -P "$2" "$1"
    fi
}

# Allow user to disable provisioning if they started with a script they didn't want
if [[ ! -f /.noprovisioning ]]; then
    provisioning_start
fi
