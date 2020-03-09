//
/**
 * @brief  	<#usage#>
 * @author 	whc
 * @date   	2020/2/29
 */
	

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;


@end

