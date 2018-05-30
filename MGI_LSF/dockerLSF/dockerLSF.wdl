workflow dockerLSF {
  call Task1
  call Task2
  call Task3
}

task Task1 {
  command {
    echo "In task1"
    echo "task1" > task1.out
  }
  runtime {
    docker: "seqfu/bionic:libnss"
  }
  output {
    File task1out = "task1.out"
  }
}

task Task2 {
  command {
    echo "In task2"
    echo "task2" > task2.out
  }
  runtime {
    docker: "seqfu/bionic:libnss"
  }
  output {
    File task2out = "task2.out"
  }
}

task Task3 {
  command {
    echo "In task3"
    echo "task3" > task3.out
  }
  runtime {
    docker: "seqfu/bionic:libnss"
  }
  output {
    File task3out = "task3.out"
  }
}
