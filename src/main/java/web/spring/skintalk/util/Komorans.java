package web.spring.skintalk.util;

import java.util.List;

import kr.co.shineware.nlp.komoran.core.analyzer.Komoran;
import kr.co.shineware.util.common.model.Pair;

public class Komorans {
	public static void main(String[] args) {
		Komoran komoran = new Komoran("/Users/hongdaeui/Downloads/models-light");
		
		String keyword = "스킨";
		
		List<List<Pair<String,String>>> result = komoran.analyze(keyword);
		for (List<Pair<String, String>> eojeolResult : result) {
		for (Pair<String, String> wordMorph : eojeolResult) {
		System.out.println(wordMorph);
		}
		System.out.println();
		}
	}
}
