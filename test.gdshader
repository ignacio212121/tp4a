shader_type canvas_item;

uniform sampler2D mask_texture;

void fragment() {
    vec4 color = texture(TEXTURE, UV); // Obtiene el color de la imagen original
    vec4 mask = texture(mask_texture, UV); // Obtiene el color de la máscara en la posición UV

    // Aplicar transparencia basada en la máscara acumulada
    color.a *= 1.0 - mask.r; // Si la máscara es blanca, el área será transparente

    COLOR = color;
}
