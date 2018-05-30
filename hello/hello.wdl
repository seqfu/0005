workflow Hello {
  String greeting

  call helloTask {
    input: greeting=greeting
  }
}

task helloTask {
  String greeting
  command {
    echo ${greeting}
  }
  output {
    String out = greeting
  }
}
