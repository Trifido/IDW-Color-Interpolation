using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Sensor : MonoBehaviour
{
    private Vector4 CoordWeight;
    public float WeightValue;
    // Start is called before the first frame update
    private void Awake()
    {
        CoordWeight = new Vector4(transform.position.x, transform.position.y, transform.position.z, WeightValue);
    }

    void Start()
    {
        
    }

    // Update is called once per frame
    void Update()
    {
        CoordWeight = new Vector4(transform.position.x, transform.position.y, transform.position.z, WeightValue);
    }

    public Vector4 GetCoordWeight()
    {
        return CoordWeight;
    }
}
