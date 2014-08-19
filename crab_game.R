
crab.game <- function(pts = 0, rounds = 0){
  answers <- data.frame(user = c("Sesarma", "Spartina", "Callinectes"), Sesarma.value = c(0, -1, 1),
                        Spartina.value = c(1, 0, -1), Callinectes.value = c(-1, 1, 0), 
                        verb = c(" eats ", " blocks ", " devours "))
  user <- readline("

Sesarma, Spartina, Callinectes, shoot!  ")
  if(!user %in% answers$user) stop("You can only play 'Sesarma', 'Spartina', or 'Callinectes' ")
  comp <- answers$user[round(runif(1, 0.5, 3.5))]  # could also use sample()
  outcome.num <- answers[answers$user == user, paste0(comp, ".value")]  
  rounds <- ifelse(rounds == 0, 1, rounds + 1)
  pts <- c(pts, outcome.num)
  score <- sum(pts)
  outcome <- ifelse(outcome.num == 0, "It's a tie", ifelse(outcome.num == -1, paste0(comp,
              answers$verb[answers$user == comp], user, "; you lost"), paste0(user,
              answers$verb[answers$user == user], comp, "; you won")))
  print(paste0("Computer played ", comp, ". ", outcome, "!"))
  print(paste0("Current score: ", score, " points over ", rounds, " rounds"))
  # cont <- readline("Play again? y/n ")
  #if(cont == "y" | cont == "yes") {
  crab.game(pts = score, rounds = rounds)
  #}
}
