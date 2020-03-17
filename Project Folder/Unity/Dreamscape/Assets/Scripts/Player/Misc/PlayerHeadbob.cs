// Have a nice day ;)
using UnityEngine;

public class PlayerHeadbob : MonoBehaviour {

    public float walkingBobAmount = 0.3f;
    public float runingBobAmount = 0.3f;
    public float bobbingSpeed = 0.18f;
    public float midpoint = 1.0f;

    float timer = 0.0f;
    float translateChange;

    void Update() {
        float waveslice = 0.0f;
        float horizontal = Input.GetAxis("Horizontal");
        float vertical = Input.GetAxis("Vertical");

        Vector3 cSharpConversion = transform.localPosition;

        if (Mathf.Abs(horizontal) == 0 && Mathf.Abs(vertical) == 0) {
            timer = 0.0f;
        } else {
            waveslice = Mathf.Sin(timer);
            timer = timer + bobbingSpeed;
            if (timer > Mathf.PI * 2) {
                timer = timer - (Mathf.PI * 2);
            }
        }
        if (waveslice != 0) {
            if (Input.GetKey(KeyCode.LeftShift)) {
                translateChange = waveslice * runingBobAmount;
            } else {
                translateChange = waveslice * walkingBobAmount;
            }
            
            float totalAxes = Mathf.Abs(horizontal) + Mathf.Abs(vertical);
            totalAxes = Mathf.Clamp(totalAxes, 0.0f, 1.0f);
            translateChange = totalAxes * translateChange;
            cSharpConversion.y = midpoint + translateChange;
        } else {
            cSharpConversion.y = midpoint;
        }

        transform.localPosition = cSharpConversion;
    }
}
