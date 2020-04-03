varying vec2 v_texCoord;

uniform vec4 u_grayParam;

void main()
{
	vec4 texColor = texture2D(CC_Texture0,v_texCoord);
	texColor.r = texColor.r * u_grayParam.r + texColor.g * u_grayParam.g + texColor.b * u_grayParam.b;
	texColor.g = texColor.r * u_grayParam.r + texColor.g * u_grayParam.g + texColor.b * u_grayParam.b;
	texColor.b = texColor.r * u_grayParam.r + texColor.g * u_grayParam.g + texColor.b * u_grayParam.b;
	gl_FragColor = texColor;
}