# Code to simulate a M/M/1 Queue

# Defining constants
tend = 1000    # Time for end of simulation
lambda = 1     # Arrival rate
mu = 4/3       # Service rate

# Creating lists to store values
arrivalTime = c()
entryTime = c()
exitTime = c()
serviceTime = c()
interarrivalTime = c()
residentTime = c()

# Defining runtime variables
k = 1        # kth arrival
t = 0.0      # Simulation time

# Running the simulation

# First arrival
interarrivalTime[k] = rexp(1,lambda)
arrivalTime[k] = t + interarrivalTime[k]
serviceTime[k] = rexp(1,mu)
entryTime[k] = arrivalTime[k]
exitTime[k] = entryTime[k] + serviceTime[k]

while(exitTime[k] < tend) {
 # print(k)
k = k + 1
interarrivalTime[k] = rexp(1,lambda)
serviceTime[k] = rexp(1,mu)

arrivalTime[k] = arrivalTime[k-1] + interarrivalTime[k]

if(arrivalTime[k] < exitTime[k-1]) {
  entryTime[k] = exitTime[k-1]
  exitTime[k] = entryTime[k] + serviceTime[k]
} else{
  entryTime[k] = arrivalTime[k]
  exitTime[k] = entryTime[k] + serviceTime[k]
}
}
residentTime = exitTime - arrivalTime
print(mean(residentTime))