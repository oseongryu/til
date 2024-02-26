## flatlist inside scrollview
VirtualizedLists should never be nested inside plain ScrollViews with the same orientation because it can break windowing and other functionality - use another VirtualizedList-backed container instead. 

### before
```js

<ScrollView >
    <FlatList />
</ScrollView>

```

### after
```js
<ScrollView horizontal={false} style={{width: '100%', height: '100%'}}>
    <ScrollView horizontal={true} style={{width: '100%', height: '100%'}}>
        <FlatList />
    </ScrollView>
</ScrollView>
```
## Navigator
### Drawer
```js
function MainStackComponent() {
  const MainStack = createStackNavigator();
  return (
    <MainStack.Navigator>
      <MainStack.Screen name="HomeIndex" component={HomeIndex} options={({route}) => ({title: route.name, headerShown: false})} />
    </MainStack.Navigator>
  );
}

function YoutubeIframeStackComponent() {
  // var videoId = route?.params?.id;
  const StackNavigator = createStackNavigator();
  return (
    <StackNavigator.Navigator>
      <StackNavigator.Screen name="YoutubeIframeIndex" component={YoutubeIframeIndex} options={({route}) => ({title: route.name, headerShown: false})} />
    </StackNavigator.Navigator>
  );
}

// 드로어 네비게이터
const DrawerNav = ({navigation, route}) => {
  const DrawerNavigator = createDrawerNavigator();
  return (
    <DrawerNavigator.Navigator>
      <DrawerNavigator.Screen
        key={'HomeIndex'}
        name={'home'}
        component={MainStackComponent}
        options={{
          headerShown: false,
          unmountOnBlur: true,
        }}
      />
      <DrawerNavigator.Screen
        key={'YoutubeIframeIndex'}
        name={'youtube'}
        component={YoutubeIframeStackComponent}
        options={{
          headerShown: false,
          unmountOnBlur: true,
        }}
      />
    </DrawerNavigator.Navigator>
  );
};
```

### BottomTab
```js
const MainTabNav = ({navigation, route}) => {
  const BottomTabNavigator = createBottomTabNavigator();
  // var videoId = route?.params?.id;
  return (
    <BottomTabNavigator.Navigator>
      {bottomRoutes.map(data => (
        <BottomTabNavigator.Screen
          // initialParams={{id: videoId}}
          key={data.name}
          name={data.label}
          component={data.component}
          options={{
            tabBarShowLabel: false,
            headerShown: false,
            unmountOnBlur: true,
            tabBarIcon: ({focused}) => {
              return <Image source={focused ? data.activeMenu : route.inactiveMenu} style={{width: 15, height: 15}} />;
            },
            tabBarStyle: {height: 50},
          }}
        />
      ))}
    </BottomTabNavigator.Navigator>
  );
};

const bottomRoutes = [
  {
    name: 'home',
    label: 'home',
    component: HomeIndex,
    inactiveMenu: Images.menu_home_off,
    activeMenu: Images.menu_home_on,
  },
  {
    name: 'iframe',
    label: 'iframe',
    component: YoutubeIframeIndex,
    inactiveMenu: Images.menu_youtube_off,
    activeMenu: Images.menu_youtube_on,
  },
];
```


## we have failed to run 'bundletool build-apks' on this android app bundle



## The emulator process for AVD Pixel5API31 has terminated.
```bash
https://codingjerk-diary.tistory.com/entry/Android%EC%98%A4%EB%A5%98%ED%95%B4%EA%B2%B0-The-emulator-process-for-AVD-has-terminated
```

## custom react-native-appstate-hook
```js
// https://github.com/amrlabib/react-native-appstate-hook/issues/17
const useAppState = settings => {
  const {onChange, onForeground, onBackground} = settings || {};
  const [appState, setAppState] = useState(AppState.currentState);

  useEffect(() => {
    const handleAppStateChange = nextAppState => {
      if (nextAppState === 'active' && appState !== 'active') {
        isValidFunction(onForeground) && onForeground();
      } else if (
        appState === 'active' &&
        nextAppState.match(/inactive|background/)
      ) {
        isValidFunction(onBackground) && onBackground();
      }
      setAppState(nextAppState);
      isValidFunction(onChange) && onChange(nextAppState);
    };
    AppState.addEventListener('change', handleAppStateChange);

    return () => {
      AppState.removeEventListener('change', handleAppStateChange);
    };
  }, [onChange, onForeground, onBackground, appState]);

  return {appState};
};
```

## gesture
```js
import {useFocusEffect} from '@react-navigation/native';

  const pan = useRef(new Animated.ValueXY()).current;

  const panResponder = useRef(
    PanResponder.create({
      // onStartShouldSetPanResponder: 스와이프를 시작해야 할지 여부를 결정합니다.
      onStartShouldSetPanResponder: (evt, gestureState) => true, // 스와이프 허용

      // onStartShouldSetPanResponderCapture: 스와이프를 위한 캡처 여부를 결정합니다.
      onStartShouldSetPanResponderCapture: (evt, gestureState) => true, // 스와이프 허용

      // onMoveShouldSetPanResponder: 스와이프를 진행할지 여부를 결정합니다.
      onMoveShouldSetPanResponder: (evt, gestureState) => true, // 스와이프 허용

      // onMoveShouldSetPanResponderCapture: 스와이프를 위한 캡처 여부를 결정합니다.
      onMoveShouldSetPanResponderCapture: (evt, gestureState) => true, // 스와이프 허용

      // onPanResponderMove: 스와이프 동작에 대한 처리를 합니다.
      onPanResponderMove: (evt, gestureState) => {
        // 스와이프 동작에 따른 처리 로직

        // console.log('start', evt);
        console.log('start', gestureState);
      },

      // onPanResponderRelease: 스와이프가 끝났을 때 처리를 합니다.
      onPanResponderRelease: (evt, gestureState) => {
        // 스와이프 종료 후 처리 로직
        // console.log('end', evt);
        console.log('end', gestureState);
      },
    }),
  ).current;

              <Animated.View
                style={{
                  transform: [{translateY: pan.y}],
                }}
                {...panResponder.panHandlers}>
              </Animated.View>
```