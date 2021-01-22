import java.util.Random;
import java.util.stream.Stream;
import java.util.stream.Collectors;
import java.util.Optional;
import java.util.stream.IntStream;
import java.util.List;
import java.util.ArrayList;


public class HorseServiceImpl implements HorseService {

	static String winner = null;

	public void createHorses(int tracks) {
		
		UserInput hcount = new UserInput();
		Random randomPick = new Random(); 
		warCry();

		if (tracks == 0) {
			UserInput.distanceInput();
		}
		
		UserInput.horseInput();

		IntStream.range(1, (hcount.horseCount + 1)).forEach(num -> {
			int randWarCry = randomPick.nextInt(warCry().size()); 
			horseList.add(new Horses("horse" + num, randomPick.nextBoolean(), 0, warCry().get(randWarCry)));
		} );

		System.out.println("\nList of Horses Created!\n");
		horseList.forEach(System.out::println);

	}

	public void filterHorses() {

		horseList.parallelStream()
				.filter(h -> h.healthy.equals(true))
		        .collect(Collectors.toList())
		        .forEach(f -> filteredHorse.add(f));

		System.out.println("\nHealthy Horse Selected!\n");

		filteredHorse.stream().forEach(h -> System.out.println(h.printHorseList()));

		System.out.println("\nNumber of Healthy Horses : " + filteredHorse.size());
		
	}

	public void validateHorses() {

		UserInput input = new UserInput();

		if (filteredHorse.size() >= 2) {
				UserInput.promptEnterKey();
			countdownTimer();		
		} else {
			System.out.println("Cannot Start the race if Horse is less than 2!");
			clearHorses(warCry());
			createHorses(input.tracks);
			filterHorses();
			validateHorses();
		}

	}

	public void clearHorses(List<String> warCries) {
		warCries.clear();
		horseList.clear();
		filteredHorse.clear();
	}

	public List<Integer> raceStart(int tracks) {

		List<Integer> speed = new ArrayList<>();	
		
		boolean finish = false;
		int horses = filteredHorse.size();
		IntStream.range(0, (horses)).forEach(i -> speed.add(0));

		do {
			for (int i = 0; i < horses; i++) {
        	//IntStream.range(0, (horses)).forEach(i -> {
	        	    speed.set(i, speed.get(i) + 1+ (((int) (Math.random() * 10)/2)));
		    
		   			 filteredHorse.set(i, new Horses(filteredHorse.get(i).getName(), 
	        		   						   filteredHorse.get(i).getHealth(), 
	        		   						   speed.get(i), 
	        		   						   filteredHorse.get(i).getWarCry()));
					if (speed.get(i) >= tracks) {
						finish = true;
						break;	
					}
					
	        }
			/*	        
	        System.out.println("\n\n\n");

   			IntStream.range(0, (horses)).forEach(x -> { 
			  				System.out.println(filteredHorse.get(x).getName() 
			  				+" traveled: " + speed.get(x) + " meters. " 
			  				+ (tracks - speed.get(x)) + "m left.");				
  			});

   			System.out.println("\n");

	        IntStream.range(0, (horses)).forEach(x -> {
	        	IntStream.range(0, speed.get(x)).forEach(i -> {
	        		System.out.print("*");
	        	});
	        	System.out.println(filteredHorse.get(x).getName());   
	        } );
	       */ 

	    } 
		while (finish != true);  
		return speed;
	}

	public void raceEnd(int tracks, List<Integer> speed) {

		List<String> endRace = new ArrayList<>();

		int horses = filteredHorse.size();
		IntStream.range(0, (horses)).forEach(i -> {
	    	
	        if (speed.get(i) >= tracks) {

	        	Optional<String> warCry = Optional.ofNullable(filteredHorse.get(i).getWarCry());
	        	String orElse = warCry.orElse("NO WAR CRY!");
	        	
	        	winner = "\nWINNER!: \n" + filteredHorse.get(i).getName() + " finished the track! \nTraveled " + filteredHorse.get(i).getDistance() + " meters. \n" + orElse +"\n\n"; 
	        		
		    } else {
			  
			 	int distanceTraveled = tracks - speed.get(i);
			  	endRace.add(filteredHorse.get(i).getName() + " traveled " + filteredHorse.get(i).getDistance() + " meters. " + distanceTraveled + " meter/s left.");

		    }
	    });

	    if (winner != null) {
	    	System.out.println(winner);
	    }

	    System.out.println("LOOSER!: ");
	    endRace.parallelStream().forEach(System.out::println);

	}

	private static List<String> warCry() {

		List<String> warCries = new ArrayList<>();

		warCries.add("Remember the Alamo!");
		warCries.add("The Rebel Yell!");
		warCries.add("Greek 'Alala' and 'Eleleu'!");
		warCries.add("There is no land for us beyond the Volga!");
		warCries.add("The Roman Barritus!");
		warCries.add("Deus Hoc Vult!");
		warCries.add("Tenno Heika Banzai!");
		warCries.add("Liberty or Death!");
		warCries.add("Tulta munille!");
		warCries.add("Currahee!");
		warCries.add("Uurah!");
		warCries.add("Deseperta Ferro!");
		warCries.add("Uukhai!");
		warCries.add("Tenno Heika Banzai!");
		warCries.add("The Rebel Yell!");
		warCries.add("Dieu et Mon Droit!");
		warCries.add(null); 
		warCries.add(null); 
		warCries.add(null); 
		return warCries;

	}

	private static void countdownTimer() {
		try {

			System.out.println();

			for (int x = 3 ; x > 0 ; x--) {
				System.out.println("Race will start in : " + x +"!");
				Thread.sleep(1000);
		 	}

		 	System.out.println();

		} catch (InterruptedException e) {
			Thread.currentThread().interrupt();
		}

	}
}