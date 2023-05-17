/** @type {import('next').NextConfig} */
const nextConfig = {
    assetPrefix : "./",
    output: "docs",
    reactStrictMode: true,
    webpack: (config, options) => {
        config.module.rules.push({
            test: /\.(glsl|vs|fs|vert|frag)$/,
            use: ["raw-loader", "glslify-loader"],
        });

        return config;
    },
};

module.exports = nextConfig;
