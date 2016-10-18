# Code to simulate M/M/C queue

# Defining parameters
tend = 10000
lambda = 1
mu = 4/3
c = 4

# Creating lists to store the times
interarrivalTime = c()
arrivalTime = c()
serviceTime = c()
entryTime = c()
exitTime = c()

# Creating server state
serverState = seq(1,c,1)
serverState[serverState<=c] = 0

# Simulation parameters
t = 0.0
k = 0

# Running the simulation

while(TRUE) {
  print(k)
  # Arrival event occurs
  k = k + 1
  interarrivalTime[k] = rexp(1,lambda)
  serviceTime[k] = rexp(1,mu)
  if(k==1) {
    arrivalTime[k] = 0.0 + interarrivalTime[k]
  } else {
    arrivalTime[k] = arrivalTime[k-1] + interarrivalTime[k]
  }
  
  acceptingSystem = which.min(serverState)
  if(arrivalTime[k] < serverState[acceptingSystem]) {
    entryTime[k] = serverState[acceptingSystem]
    exitTime[k] = entryTime[k] + serviceTime[k]
    serverState[acceptingSystem] = exitTime[k]
  }else {
    entryTime[k] = arrivalTime[k]
    exitTime[k] = entryTime[k] + serviceTime[k]
    serverState[acceptingSystem] = exitTime[k]
  }
  
  # Simulation break condition
  if(exitTime[k] > tend) {
    break
  }
}

# Verification
residentTime = exitTime - arrivalTime
print(mean(residentTime))

