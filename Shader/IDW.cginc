float4 _CoordWeightSensor[20];
float P;
int _LengthSensor;
float _Alpha;

float4 _Color1, _Color2, _Color3, _Color4;

float IDWAverage(float3 fragPos)
{
	float sum, wsum, dist;
	sum = wsum = 0.0;

	for (int i = 0; i < _LengthSensor; i++)
	{
		dist = distance(fragPos, _CoordWeightSensor[i].rgb);
		if (dist > 0.0) {
			float w = 1.0 / pow(dist, P);
			sum += _CoordWeightSensor[i].a * w;
			wsum += w;
		}
	}

	return sum / wsum;
}

float3 GradientColor(float t)
{
	float3 c4 = _Color4.rgb;
	float3 c3 = _Color3.rgb;
	float3 c2 = _Color2.rgb;
	float3 c1 = _Color1.rgb;
	float step1 = 0.0f;
	float step2 = 0.33f;
	float step3 = 0.66f;
	float step4 = 1.0f;

	float t1 = clamp((t - step1) / (step2 - step1), 0.0f, 1.0f);
	float sm1 = t1 * t1 * (3.0f - 2.0f * t1);

	float t2 = clamp((t - step2) / (step3 - step2), 0.0f, 1.0f);
	float sm2 = t2 * t2 * (3.0f - 2.0f * t2);

	float t3 = clamp((t - step3) / (step4 - step3), 0.0f, 1.0f);
	float sm3 = t3 * t3 * (3.0f - 2.0f * t3);

	float3 color = lerp(c1, c2, sm1);
	color = lerp(color, c3, sm2);
	color = lerp(color, c4, sm3);

	return color;
}