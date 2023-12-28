# Flutter Study

![image](https://github.com/rimgosu/FlutterStudy/assets/120752098/05e48dd7-ea62-44eb-a313-7a75eb370ef2)


## Dart 기본 문법
### 자료형
#### var를 사용한 변수 선언

- 변수에 값이 들어가면 자동으로 타입을 추론하는 타입
```
void main() {
  var name = '이경용';
  print(name);
  //var name = '홍길동';
}
```
- var name = "홍길동"; 앞에 주석 제거시 에러가 난다. 변수명 중복은 불가능

​

#### dynamic 변수 선언

- var의 경우 데이터가 한번 들어가면 고정된 변수 타입으로 된다. 따라서, 다른 타입의 값이 들어가면 에러가 난다.
```
void main() {
  var name = '이경용';
  print(name);
  name = 20; // error
}
```
- dynamic 키워드를 사용하면 변수의 타입이 고정되지 않아서 다른 타입의 값을 저장할 수 있다.

```
void main() {
  dynamic name = '이경용';
  print(name);
  name = 20; // ok
}
```
#### final / const 변수

- final과 const 키워드는 변수의 값을 처음 선언 후 변경할 수 없다.
```
void main() {
  final String name = '이경용';
  name = '홍길동'; //error
  
  const String name2 = '이경용';
  name = '홍길동'; //error
}
```
- final 런타임 상수, const 빌드타임 상수

```
void main() {
  final DateTime now = DateTime.now(); //ok
  print(now);
  
  const DataTime now2 = DateTime.now(); //error
  print(now2);
}
```

### 리스트

#### List 타입

- 여러개의 값을 저장할 때 활용.

- .length : 전체 갯수 확인

- [0] : index 주소로 값 가져오기

- .add() : 값 추가하기

- where() : List에 있는 값들을 순서대로 순회 하면서 특정 조건에 맞는 값만 필터링하는데 사용

- map() : List에 있는 값들을 순서대로 순회 하면서 값을 변경할 수 있다.

- reduce() : List에 있는 값들을 순회하면서 매개변수에 입력된 함수를 실행한다. 순회할 때마다 값을 쌓아두는 특징이 있다.

- fold() : fold(), reduce() 함수의 특수 형태, reduce() 함수는 리스트를 구성하는 값들의 타입과 반환되는 리스트를 구성할 값들의 타입이 완전히 같아야 하지만 fold() 함수는 그러 제약이 없다. 첫 번째 매개변수에 시작할 값을 지정하고 두 번째 매개변수에는 reduce() 함수와 똑같이 작동하는 함수를 입력한다. 두 번째 매개변수인 (value, element) => value + element.length는 람다식으로 value에는 최초 순회 때는 초기값(여기서는 0)이 입력되고 이후에는 기존 순회의 반환값이 입력된다. element는 리스트의 다음 값이 입력된다.
```
void main() {
  List<String> menuList = ['짜장면', '짬뽕', '우동', '탕수육'];
  print(menuList);
  print(menuList.length);
  print(menuList[1]);
  menuList.add('라조기');
  print(menuList);
  
  final newList = menuList.where(
    (name) => name == '짜장면' || name == '짬뽕',
  );
  print(newList);
  print(newList.toList()); // Iterable을 List로 변환
  
  final newList2 = menuList.map(
    (name) => '$name 1개',
  );
  print(newList2.toList());
  
  final newList3 = menuList.reduce(
    (value, element) => '$value , $element'
  );
  print(newList3);
  
  final newList4 = menuList.fold<int>(
    0, (value, element) => value + element.length
  );
  print(newList4);
}
```

### enum 타입

- 지정된 값에서만 선택하도록 할 때 사용
```
enum Status {move, attack, die}

void main() {
  Status status = Status.attack;
  print(status);
}
```


### null 관련 연산자

- null은 아무 값도 없을 뜻한다. 0과 다르다. 

- 따라서 변수에 null 값을 저장하면 오류가 난다.

- 타입 뒤에 ? 표시를 추가해서 null 값을 가질 수 있다.
```
void main() {
  double? number1; //ok
  print(number1);
  double number2 = null; //error
}
```
- null 을 가질 수 있는 변수에 새로운 값을 추가할 때 ??를 사용하면 기존에 null인 때만 값이 저장된다.

```
void main() {
  double? number;
  print(number);
  number ??= 1;
  print(number);
  number ??= 2;
  print(number);
}
```


#### 타입 비교 연산자

```
void main() {
  int num = 1;
  print(num is int); 
  print(num is String);
  print(num is! int);
  print(num is! String);
}
```

