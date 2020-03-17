using UnityEngine;

public class PlayerTank : MonoBehaviour {

    [Header ("Walking Paremeters")]
    public float rotateSpeed = 90f;
    public float walkSpeed = 5;
    public float runSpeed = 15;

    float VerticalAxis;
    float HoriontalAxis;

    void Update(){
        HoriontalAxis = Input.GetAxisRaw("Horizontal") * Time.deltaTime * rotateSpeed;
        
        if (Input.GetKey(KeyCode.LeftShift)){
            VerticalAxis = Input.GetAxisRaw("Vertical") * Time.deltaTime * runSpeed;
        }else{
            VerticalAxis = Input.GetAxisRaw("Vertical") * Time.deltaTime * walkSpeed;
        }

        // Walk
        transform.Translate(0, 0, VerticalAxis);
        
        // Rotate
        transform.Rotate(0, HoriontalAxis, 0);
    }
}
