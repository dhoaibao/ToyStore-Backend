import { pipeline } from '@xenova/transformers';

(async () => {
    try {
        const pipe = await pipeline("image-feature-extraction", "Xenova/clip-vit-base-patch32");
        const url = 'https://huggingface.co/datasets/Xenova/transformers.js-docs/resolve/main/tiger.jpg';
        const output = await pipe(url);

        console.log('Output:', output);
    } catch (error) {
        console.error('Error:', error.message);
    }
})();