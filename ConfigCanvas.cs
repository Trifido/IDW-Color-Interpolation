using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class ConfigCanvas : MonoBehaviour
{
    private Material m_IDW;
    public List<Sensor> sensors;
    public float smoothness;
    // Start is called before the first frame update

    private void Awake()
    {
        m_IDW = GetComponent<Renderer>().material;
        SetShaderUniforms();
    }

    void Start()
    {
        
    }

    // Update is called once per frame
    void Update()
    {
        
    }

    void SetShaderUniforms()
    {
        Vector4[] arrayCoordsWeight = new Vector4[sensors.Count];

        for(int i = 0; i < sensors.Count; i++)
        {
            arrayCoordsWeight[i] = sensors[i].GetCoordWeight();
        }

        m_IDW.SetInt("_LengthSensor", sensors.Count);
        m_IDW.SetFloat("P", smoothness);
        m_IDW.SetVectorArray("_CoordWeightSensor", arrayCoordsWeight);
    }
}
