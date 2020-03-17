// Have a nice day ;)
using UnityEngine;

public class PlayerMove : MonoBehaviour {

    [Header("Components")]
    public CharacterController CC;

    [Header("Settings")]
    public float walkSpeed = 12f;
    public float runSpeed = 24f;
    public float gravity = -10f;

    [Header("Ground")]
    public Transform groundCheck;
    public float gorundDistance = 0.5f;
    public LayerMask gorundMaks;

    Vector3 velocity;
    bool isGrounded;
    float speed;

	void Update () {
        isGrounded = Physics.CheckSphere(groundCheck.position, gorundDistance, gorundMaks);
        if(isGrounded && velocity.y < 0){
            velocity.y = -2f;
        }

        float x = Input.GetAxis("Horizontal");
        float z = Input.GetAxis("Vertical");

        Vector3 move = transform.right * x + transform.forward * z;

        if (!Input.GetKey(KeyCode.LeftShift)){
            speed = walkSpeed;
        }else{
            speed = runSpeed;
        }

        CC.Move(move * speed * Time.deltaTime);

        velocity.y += gravity * Time.deltaTime;

        CC.Move(velocity * Time.deltaTime);
	}
}
