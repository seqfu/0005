workflow SimpleLSF {

  Array[String] scatter_names = ["a", "b", "c"]

  scatter (scatter_name in scatter_names) {
    call Task1 {
      input: 
        name=scatter_name
    }
  }
  call Task2
  call Task3
}

task Task1 {
  String name

  command {
    echo "In task1-${name}"
    echo "task1-${name}" > task1-${name}.out
  }
  output {
    File task1out = "task1-${name}.out"
  }
}

task Task2 {
  command {
    echo "In task2"
    echo "task2" > task2.out
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
  output {
    File task3out = "task3.out"
  }
}
