/** @type {import('next').NextConfig} */
const nextConfig = {
    assetPrefix : "https://kolark.github.io/36daysoftype",
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
