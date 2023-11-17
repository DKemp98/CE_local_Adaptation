
# 0.  before starting .............. ####

# 1. add your name here: Dominik Buob
# 2. save this file under the name: "3_Local_adaptation_Buob_Dominik.R" (File -> Save as...)

rm(list=ls())    # this empties the work space (top-right window in RStudio)

# Function to simulate one year of evolution
simulate_one_year <- function(N1, N2, m, fmax, s, h, pA, pB) {
  # Step 1: Dispersal
  migrate_to_patch2 <- rbinom(1, N1, m)
  migrate_to_patch1 <- rbinom(1, N2, m)
  
  pA_prev <- pA
  pB_prev <- pB
  
  if (migrate_to_patch2 > 0) {
    pA_prev <- (pA * (N1 - migrate_to_patch2) + pB * migrate_to_patch2) / N1
  }
  
  if (migrate_to_patch1 > 0) {
    pB_prev <- (pB * (N2 - migrate_to_patch1) + pA * migrate_to_patch1) / N2
  }
  
  # Step 2: Gamete production
  gametes_patch1 <- pA_prev * fmax * (1 - s) + pB_prev * fmax * (1 - h * s)
  gametes_patch2 <- pA_prev * fmax * (1 - s) + pB_prev * fmax * (1 - (1 - h) * s)
  
  # Step 3: Fusion of gametes
  offspring_patch1 <- rbinom(1, N1, gametes_patch1 / sum(gametes_patch1))
  offspring_patch2 <- rbinom(1, N2, gametes_patch2 / sum(gametes_patch2))
  
  # Step 4: Storage of summary statistics
  pA1 <- sum(offspring_patch1 == 1) / N1
  pA2 <- sum(offspring_patch2 == 1) / N2
  dA <- pA1 - pA2
  
  return(c(pA1, pA2, dA))
}

# Function to run the simulation for multiple years
simulate_evolution <- function(N1, N2, m, fmax, s, h, pA, pB, num_years) {
  results <- matrix(NA, nrow = num_years, ncol = 3)
  results[1, ] <- c(pA, pA, 0)  # Initial allele frequencies
  
  for (year in 2:num_years) {
    # Simulate one year of evolution
    allele_freqs <- simulate_one_year(N1, N2, m, fmax, s, h, results[year - 1, 1], results[year - 1, 2])
    
    # Update results
    results[year, ] <- allele_freqs
  }
  
  colnames(results) <- c("pA1", "pA2", "dA")
  return(results)
}

# Simulation parameters
N1 <- 500
N2 <- 500
m <- 0.1
fmax <- 1
s <- 0.1
h <- 0.5
pA <- 0.5
pB <- 0.5
num_years <- 100

# Run simulation
simulation_results <- simulate_evolution(N1, N2, m, fmax, s, h, pA, pB, num_years)

# Display results (you can modify this based on your specific requirements)
print(simulation_results)

#2 Attempt

# Function to simulate one year of evolution
simulate_one_year <- function(N1, N2, m, fmax, s, h, pA, pB) {
  # Step 1: Dispersal
  migrate_to_patch2 <- rbinom(1, N1, m)
  migrate_to_patch1 <- rbinom(1, N2, m)
  
  # Calculate allele frequencies after dispersal
  pA_after_dispersal <- (pA * (N1 - migrate_to_patch2) + pB * migrate_to_patch2) / N1
  pB_after_dispersal <- (pB * (N2 - migrate_to_patch1) + pA * migrate_to_patch1) / N2
  
  # Step 2: Gamete production
  gametes_patch1 <- pA_after_dispersal * fmax * (1 - s) + pB_after_dispersal * fmax * (1 - h * s)
  gametes_patch2 <- pA_after_dispersal * fmax * (1 - s) + pB_after_dispersal * fmax * (1 - (1 - h) * s)
  
  # Step 3: Fusion of gametes
  offspring_patch1 <- rbinom(1, N1, gametes_patch1 / sum(gametes_patch1))
  offspring_patch2 <- rbinom(1, N2, gametes_patch2 / sum(gametes_patch2))
  
  # Step 4: Storage of summary statistics
  pA1 <- sum(offspring_patch1 == 1) / N1
  pA2 <- sum(offspring_patch2 == 1) / N2
  dA <- pA1 - pA2
  
  return(c(pA1, pA2, dA))
}

# Function to run the simulation for multiple years
simulate_evolution <- function(N1, N2, m, fmax, s, h, pA, pB, num_years) {
  results <- matrix(NA, nrow = num_years, ncol = 3)
  results[1, ] <- c(pA, pA, 0)  # Initial allele frequencies
  
  for (year in 2:num_years) {
    # Simulate one year of evolution
    allele_freqs <- simulate_one_year(N1, N2, m, fmax, s, h, results[year - 1, 1], results[year - 1, 2])
    
    # Update results
    results[year, ] <- allele_freqs
  }
  
  colnames(results) <- c("pA1", "pA2", "dA")
  return(results)
}

# Simulation parameters
N1 <- 500
N2 <- 500
m <- 0.1
fmax <- 1
s <- 0.1
h <- 0.5
pA <- 0.5
pB <- 0.5
num_years <- 100

# Run simulation
simulation_results <- simulate_evolution(N1, N2, m, fmax, s, h, pA, pB, num_years)

# Display results
print(simulation_results)



