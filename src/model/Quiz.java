package model;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

public class Quiz {
	private List<Question> quiz;
	private List<Answer> answers; // user answers
	private int givenAnswers;
	private int correctAnswers;
		
	public Quiz(List<Question> questions, int qNum)
	{
		this.resetQuiz(questions, qNum);
	}
	
	public Question getQuestionAt(int index) {return this.quiz.get(index);}
	public List<Question> getQuiz() {return this.quiz;}
	public List<Answer> getAnswers() {return this.answers;}
	public int getGivenAnswers() {return givenAnswers;}
	public int getCorrectAnswers() {return correctAnswers;}
	
	public void setAnswer(int index, int value)
	{
		/*if(value < 0 || value > Settings.ANSWER_NUMBER - 1)
			throw new IllegalArgumentException();*/
		
		this.answers.set(index, Answer.values()[value]);
	}
	public void setAnswer(int index, Answer value)
	{
		/*if(value < 0 || value > Settings.ANSWER_NUMBER - 1)
			throw new IllegalArgumentException();*/
		
		this.answers.set(index, value);
	}
	
	public void resetQuiz(List<Question> questions, int qNum)
	{
		// reset questions
		this.quiz = new ArrayList<Question>(qNum);
		Collections.shuffle(questions);
		for(int i = 0; i < qNum; i++)
			this.quiz.add(questions.get(i));
		
		// reset user answers
		answers = new ArrayList<Answer>(qNum);
		for(int i = 0; i < qNum; i++)
			this.answers.add(Answer.NONE);
		
		// reset counters
		this.givenAnswers = 0;
		this.correctAnswers = 0;
	}
	
	public void checkAnswers()
	{
		for(int i = 0; i < this.quiz.size(); i++)
		{
			Answer ca = this.quiz.get(i).getCorrectAnswer();
			Answer ua = this.answers.get(i);
			
			if(!ua.equals(Answer.NONE)) // already updated in setAnswer()
				this.givenAnswers++;
			if(ca.equals(ua))
				this.correctAnswers++;
		}
	}
}
