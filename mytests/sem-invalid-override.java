class MyMain {
    public static void main(String[] a){
	System.out.println(new MyDerived().Run());
    }
}

class MyBase {
    public int Run(){
	return 0;
    }
}

class MyDerived extends MyBase {
    public int Run(int x){ // �����ĺ���ǩ����һ��
	return x;
    }
}
