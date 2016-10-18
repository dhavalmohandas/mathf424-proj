# Code to simulate a M/M/1 Queue

# Defining constants
duration = 1000    # Duration of simulation
lambda = 1.25     # Arrival rate
mu = 4/3       # Service rate

# Creating lists to store values
arrivalTime = c()
entryTime = c()
exitTime = c()
residentTime = c()

# Defining runtime variables
k = 1        # kth arrival

# Running the simulation

# First arrival
arrivalTime[k] = rexp(1,lambda)
entryTime[k] = rexp(1,mu)
exitTime[k] = entryTime[k] + serviceTime[k]

while(exitTime[k] < duration) {
  k = k + 1
  arrivalTime[k] = arrivalTime[k-1] + rexp(1,lambda)
  entryTime[k] <- if(arrivalTime[k] < exitTime[k-1])
    exitTime[k-1]
  else
    arrivalTime[k]
  exitTime[k] = entryTime[k] + rexp(1,mu) 
}

residentTime = exitTime - arrivalTime