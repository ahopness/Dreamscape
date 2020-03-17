// Have a nice day ;)
using UnityEngine;

public class PlayerLook : MonoBehaviour {

    [Header("Look Settings")]
    public float Sensitivity = 50f;
    public bool isCursorLocked = true;

    [Header("Player Transform")]
    public Transform playerTransform;

    float xRotation = 0f;
    
	void Update () {
		if (isCursorLocked){
            Cursor.lockState = CursorLockMode.Locked;
            Cursor.visible = false;
        }else{
            Cursor.lockState = CursorLockMode.None;
            Cursor.visible = true;
        }

        float mouseX = Input.GetAxis("Mouse X") * Sensitivity * Time.deltaTime;
        float mouseY = Input.GetAxis("Mouse Y") * Sensitivity * Time.deltaTime;

        xRotation -= mouseY;
        xRotation = Mathf.Clamp(xRotation, -45f, 45f);

        transform.localRotation = Quaternion.Euler(xRotation, 0f, 0f);
        playerTransform.Rotate(Vector3.up, mouseX);
    }
}
