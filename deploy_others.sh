export MODEL_ID="jasonczarnecki/onlygalsV2" # change this to model at huggingface or your local repository.
export SAFETY_MODEL_ID="CompVis/stable-diffusion-safety-checker"
export IS_FP16=1
export USERNAME="jason-czar" # change this to your replicate ID.
export REPLICATE_MODEL_ID="onlygalsv2" #replciate model ID,

echo "MODEL_ID=$MODEL_ID" > .env
echo "SAFETY_MODEL_ID=$SAFETY_MODEL_ID" >> .env
echo "IS_FP16=$IS_FP16" >> .env

python script/download-weights.py
cog run python test.py --test_img2img --test_text2img --test_adapter
cog push r8.im/$USERNAME/$REPLICATE_MODEL_ID