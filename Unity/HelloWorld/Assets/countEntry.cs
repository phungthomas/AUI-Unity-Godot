using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using TMPro;
using UnityEngine.Playables;

public class countEntry : MonoBehaviour
{
    // Start is called before the first frame update
    
    private int score = 0;
    public TextMeshProUGUI textScore;
    public PlayableDirector playableDirector;
    void Start()
    {
        
    }

    void OnTriggerEnter(Collider player)
    {
        score++;
        textScore.text = "Score : " + score.ToString();
        playableDirector.Play();
    }

    // Update is called once per frame
    void Update()
    {
        
    }
}
