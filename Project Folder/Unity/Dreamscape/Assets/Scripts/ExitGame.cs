// Have a nice day ;)
using UnityEngine;

public class ExitGame : MonoBehaviour {
    
	void Update () {
        if (Input.GetKeyDown(KeyCode.Escape)) {
            Application.Quit();
        }
	}
}
