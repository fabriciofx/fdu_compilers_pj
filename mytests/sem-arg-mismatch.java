class MyMain {
    public static void main(String[] a){
	System.out.println(new MyTest().Run(100)); // ������Ŀ����ȷ
    }
}

class MyTest {
    public int Run(){
	return this.Test(true); // �������Ͳ���ȷ
    }
    public int Test(int x){
	return 0;
    }
}
