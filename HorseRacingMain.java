

public class HorseRacingMain {
	
	public static void main(String[] args) {

		UserInput input = new UserInput();
		HorseService horseService = new HorseServiceImpl();

		System.out.println();
		System.out.println("===================================");
    	System.out.println("|| WELCOME TO HORSE RACING GAME! ||");
    	System.out.println("===================================");

		horseService.createHorses(input.tracks);
		horseService.filterHorses();
		horseService.validateHorses();
		horseService.raceStart(input.tracks);
		horseService.raceEnd(input.tracks, horseService.raceStart(input.tracks));
	}

}