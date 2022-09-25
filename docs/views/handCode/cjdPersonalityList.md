---
title: 承让迪的各种人格
date: 2022-05-28 13:54:19
tags:
- Java
categories:
- 沙福林的随手代码
keys:
- 'shafulin'
isShowComments: false
---

<Boxx/>

以此程序来记录承让迪阴晴不定的心情，下方也有修改版程序，可以让她每天都能成为温柔迪，欢乐迪

## 第一版
```java
package top.zlhy7;

import java.time.LocalTime;
import java.time.temporal.ChronoUnit;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;
import java.util.stream.Collectors;

/**
 * @author 沙福林
 * @date 2022/5/28 12:53
 * @description 承让迪的多重人格
 */
public class chengRengDiPersonalityTest {
  public static void main(String[] args) {
    //定义承让迪人格列表，由于大多数情况下生气迪占多数，因此人格列表中生气迪出现次数较多
    List<String> personalityList = new ArrayList<>();
    Collections.addAll(personalityList,"承让","温柔","程序","学委","瑜伽","滑稽","沙雕","骚气",
            "入党","活动","妩媚","藏品","没错","凡的","南嘉","富婆","文案","中央","导师","皮奥尔",
            "存活","网图","嘿咻","海王","公主","生气","生气","生气","生气","生气","生气","生气");
    //定义一个随机数对象，用于模拟阴晴不定的承让迪人格，如果温柔迪占比足够大的话,沙福林会觉得很快乐，
    Random random = new Random();
    // 即温柔迪的出现频率就是沙福林的快乐指数，接下来开始模拟，假定一秒一个人格
    //遍历一天的所有秒数，即从00:00:00-23:59:59 一共23*3600+59*60+60=86400s
    int seconds = (int)(LocalTime.MIN.until(LocalTime.MAX, ChronoUnit.SECONDS))+1;
    //记录当天出现人格以及出现次数，用于统计一天出现最高的人格
    Map<String,Integer> countMap = new HashMap<>(personalityList.size());
    //当前时间
    for (int i = 0; i < seconds; i++) {
      String personality = personalityList.get(random.nextInt(personalityList.size()));
      System.out.printf("当前时间%s,承让迪出现人格：%s迪\n", LocalTime.MIN.plusSeconds(i), personality);
      //取不到就默认为空
      countMap.put(personality,countMap.getOrDefault(personality,0)+1);
    }
    //根据出现次数排序
    List<Map.Entry<String, Integer>> resultList = countMap.entrySet().stream()
            .sorted(Collections.reverseOrder(Map.Entry.comparingByValue()))
            .collect(Collectors.toList());
    System.out.println("人格排行榜为：");
    System.out.printf("序号\t人格\t出现次数 \n");
    for (int i = 0; i < resultList.size(); i++) {
      System.out.printf("%3d\t%5s迪\t%5d \n",i+1,resultList.get(i).getKey(),resultList.get(i).getValue());
    }
    //打印最终结果
    Map.Entry<String, Integer> fristPersonalityList = resultList.get(0);
    Map.Entry<String, Integer> latestPersonalityList = resultList.get(resultList.size()-1);
    System.out.printf("一天里出现最多次数的人格是 %s迪，出现次数为%d\n", fristPersonalityList.getKey(), fristPersonalityList.getValue());
    System.out.printf("一天里出现最少次数的人格是 %s迪，出现次数为%d\n",latestPersonalityList.getKey(), latestPersonalityList.getValue());
    //已出现人格
    List<String> appearPersonalityList = resultList.stream().map(Map.Entry::getKey).collect(Collectors.toList());
    //未出现人格
    List<String> noAppearPersonalityList = new ArrayList<>(personalityList);
    noAppearPersonalityList.removeAll(appearPersonalityList);
    System.out.println("全部人格:"+String.join(",",personalityList));
    System.out.println("已出现人格:"+String.join(",",appearPersonalityList));
    System.out.println("未出现人格:"+String.join(",",noAppearPersonalityList));
  }
}
```
执行效果如下

![](/znote/img/handCode/第一版-人格排行榜.png)

![](/znote/img/handCode/第一版-人格排行榜汇总.png)
> 由于生气迪出现次数太多，不符合承让迪要求，为此我们可以将程序进行改造，让温柔迪多出现点
> 
> 关键点就在于承让迪阴晴不定的人格顺序上，所以我们将她所期待的人格往前放，想摒弃的人格往后放，删减部分生气人格，只取期待的人格即可
## 修改版
```java
//原代码
Collections.addAll(personalityList,"承让","温柔","程序","学委","瑜伽","滑稽","沙雕","骚气",
        "入党","活动","妩媚","藏品","没错","凡的","南嘉","富婆","文案","中央","导师","皮奥尔",
        "存活","网图","嘿咻","海王","公主","生气","生气","生气","生气","生气","生气","生气");
//将期待人格前置，摒弃人格后置，修改之后如下
Collections.addAll(personalityList,"承让","温柔","文案","公主","入党","程序","学委","嘿咻","瑜伽","滑稽","沙雕","骚气",
        "活动","妩媚","藏品","没错","凡的","南嘉","富婆","中央","导师","皮奥尔","存活","网图","海王","生气");

//原代码
String personality = personalityList.get(random.nextInt(personalityList.size()));
//将取值范围缩小到只取前一半，而不是所有，修改之后为
String personality = personalityList.get(random.nextInt(personalityList.size()/2));
```
修改之后完整程序如下
```java
package top.zlhy7;

import java.time.LocalTime;
import java.time.temporal.ChronoUnit;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;
import java.util.stream.Collectors;

/**
 * @author 沙福林
 * @date 2022/5/28 12:53
 * @description 承让迪的多重人格
 */
public class chengRengDiPersonalityTest {
    public static void main(String[] args) {
        //定义承让迪人格列表，由于大多数情况下生气迪占多数，因此人格列表中生气迪出现次数较多
        List<String> personalityList = new ArrayList<>();
        Collections.addAll(personalityList,"承让","温柔","文案","公主","入党","程序","学委","嘿咻","瑜伽","滑稽","沙雕","骚气",
                "活动","妩媚","藏品","没错","凡的","南嘉","富婆","中央","导师","皮奥尔","存活","网图","海王","生气");
        //定义一个随机数对象，用于模拟阴晴不定的承让迪人格，如果温柔迪占比足够大的话,沙福林会觉得很快乐，
        Random random = new Random();
        // 即温柔迪的出现频率就是沙福林的快乐指数，接下来开始模拟，假定一秒一个人格
        //遍历一天的所有秒数，即从00:00:00-23:59:59 一共23*3600+59*60+60=86400s
        int seconds = (int)(LocalTime.MIN.until(LocalTime.MAX, ChronoUnit.SECONDS))+1;
        //记录当天出现人格以及出现次数，用于统计一天出现最高的人格
        Map<String,Integer> countMap = new HashMap<>(personalityList.size());
        //当前时间
        for (int i = 0; i < seconds; i++) {
            String personality = personalityList.get(random.nextInt(personalityList.size()/2));
            System.out.printf("当前时间%s,承让迪出现人格：%s迪\n", LocalTime.MIN.plusSeconds(i), personality);
            //取不到就默认为空
            countMap.put(personality,countMap.getOrDefault(personality,0)+1);
        }
        //根据出现次数排序
        List<Map.Entry<String, Integer>> resultList = countMap.entrySet().stream()
                .sorted(Collections.reverseOrder(Map.Entry.comparingByValue()))
                .collect(Collectors.toList());
        System.out.println("人格排行榜为：");
        System.out.printf("序号\t人格\t出现次数 \n");
        for (int i = 0; i < resultList.size(); i++) {
            System.out.printf("%3d\t%5s迪\t%5d \n",i+1,resultList.get(i).getKey(),resultList.get(i).getValue());
        }
        //打印最终结果
        Map.Entry<String, Integer> fristPersonalityList = resultList.get(0);
        Map.Entry<String, Integer> latestPersonalityList = resultList.get(resultList.size()-1);
        System.out.printf("一天里出现最多次数的人格是 %s迪，出现次数为%d\n", fristPersonalityList.getKey(), fristPersonalityList.getValue());
        System.out.printf("一天里出现最少次数的人格是 %s迪，出现次数为%d\n",latestPersonalityList.getKey(), latestPersonalityList.getValue());
        //已出现人格
        List<String> appearPersonalityList = resultList.stream().map(Map.Entry::getKey).collect(Collectors.toList());
        //未出现人格
        List<String> noAppearPersonalityList = new ArrayList<>(personalityList);
        noAppearPersonalityList.removeAll(appearPersonalityList);
        System.out.println("全部人格:"+String.join(",",personalityList));
        System.out.println("已出现人格:"+String.join(",",appearPersonalityList));
        System.out.println("未出现人格:"+String.join(",",noAppearPersonalityList));
    }
}

```
执行效果如下

![](/znote/img/handCode/优化版-人格排行榜.png)
