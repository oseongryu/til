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
