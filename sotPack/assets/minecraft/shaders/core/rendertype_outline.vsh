#version 150

#moj_import <minecraft:dynamictransforms.glsl>
#moj_import <minecraft:projection.glsl>

in vec3 Position;
in vec4 Color;
in vec2 UV0;

out vec4 vertexColor;
out vec2 texCoord0;

void main() {
    gl_Position = ProjMat * ModelViewMat * vec4(Position, 1.0);

    texCoord0 = UV0;
    // MCC - move down

    // MCC start - gray color to party blue
    if (distance(Color, vec4(170.0, 170.0, 170.0, 255.0) / 255.0) < 0.05) {
        vertexColor = vec4(0.659, 0.659, 0.988, 1.0);
    } else {
        vertexColor = Color;
    }
    // MCC end - gray color to party blue
}
