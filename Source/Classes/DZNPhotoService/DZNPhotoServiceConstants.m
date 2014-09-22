//
//  DZNPhotoServiceConstants.m
//  DZNPhotoPickerController
//  https://github.com/dzenbot/DZNPhotoPickerController
//
//  Created by Ignacio Romero Zurbuchen on 2/14/14.
//  Copyright (c) 2014 DZN Labs. All rights reserved.
//  Licence: MIT-Licence
//

#import "DZNPhotoServiceConstants.h"
#import "DZNPhotoMetadata.h"
#import "DZNPhotoTag.h"

NSString *const DZNPhotoServiceClientIndentifier =      @"com.dzn.photoService.client.identifier";
NSString *const DZNPhotoServiceClientConsumerKey =      @"com.dzn.photoService.client.consumer_key";
NSString *const DZNPhotoServiceClientConsumerSecret =   @"com.dzn.photoService.client.consumer_secret";
NSString *const DZNPhotoServiceClientSubscription =     @"com.dzn.photoService.subscription";
NSString *const DZNPhotoServiceCredentialIdentifier =   @"com.dzn.photoService.credential.identifier";
NSString *const DZNPhotoServiceCredentialAccessToken =  @"com.dzn.photoService.credential.access_token";


NSString *NSUserDefaultsUniqueKey(NSUInteger type, NSString *key)
{
    return [NSString stringWithFormat:@"%@.%@_%@", DZNPhotoServiceClientIndentifier, NSStringFromService(type), key];
}

NSURL *baseURLForService(DZNPhotoPickerControllerServices service)
{
    switch (service) {
        case DZNPhotoPickerControllerService500px:              return [NSURL URLWithString:@"https://api.500px.com/v1"];
        case DZNPhotoPickerControllerServiceFlickr:             return [NSURL URLWithString:@"https://api.flickr.com/services/rest/"];
        case DZNPhotoPickerControllerServiceInstagram:          return [NSURL URLWithString:@"https://api.instagram.com/v1/"];
        case DZNPhotoPickerControllerServiceGoogleImages:       return [NSURL URLWithString:@"https://www.googleapis.com/customsearch/v1/"];
        case DZNPhotoPickerControllerServiceBingImages:         return [NSURL URLWithString:@"https://api.datamarket.azure.com/"];
        case DZNPhotoPickerControllerServiceGettyImages:        return [NSURL URLWithString:@"https://connect.gettyimages.com/"];
        default:                                                return nil;
    }
}

NSString *keyPathForTagService(DZNPhotoPickerControllerServices service)
{
    switch (service) {
        case DZNPhotoPickerControllerService500px:
        case DZNPhotoPickerControllerServiceFlickr:             return @"tags.tag";
        case DZNPhotoPickerControllerServiceInstagram:          return @"data";
        default:                                                return nil;
    }
}

NSString *urlPathForTagService(DZNPhotoPickerControllerServices service)
{
    switch (service) {
        case DZNPhotoPickerControllerServiceFlickr:             return @"flickr.tags.getRelated";
        case DZNPhotoPickerControllerServiceInstagram:          return @"tags/search";
        default:                                                return nil;
    }
}

NSString *keyPathForPhotoService(DZNPhotoPickerControllerServices service)
{
    switch (service) {
        case DZNPhotoPickerControllerService500px:              return @"photos";
        case DZNPhotoPickerControllerServiceFlickr:             return @"photos.photo";
        case DZNPhotoPickerControllerServiceInstagram:          return @"data";
        case DZNPhotoPickerControllerServiceGoogleImages:       return @"items";
        case DZNPhotoPickerControllerServiceBingImages:         return @"d.results";
        case DZNPhotoPickerControllerServiceGettyImages:        return @"images";
        default:                                                return nil;
    }
}

NSString *urlPathForPhotoService(DZNPhotoPickerControllerServices service)
{
    switch (service) {
        case DZNPhotoPickerControllerService500px:              return @"photos/search";
        case DZNPhotoPickerControllerServiceFlickr:             return @"flickr.photos.search";
        case DZNPhotoPickerControllerServiceInstagram:          return @"tags/%@/media/recent";
        case DZNPhotoPickerControllerServiceGoogleImages:       return @"";
        case DZNPhotoPickerControllerServiceBingImages:         return @"Bing/Search/Image?$format=json";
        case DZNPhotoPickerControllerServiceGettyImages:        return @"v3/search/images/creative";
        default:                                                return nil;
    }
}

NSString *urlPathForAuthService(DZNPhotoPickerControllerServices service)
{
    switch (service) {
        case DZNPhotoPickerControllerServiceGettyImages:        return @"oauth2/token/";
        default:                                                return nil;
    }
}

NSString *keyForAPIConsumerKey(DZNPhotoPickerControllerServices service)
{
    switch (service) {
        case DZNPhotoPickerControllerService500px:              return @"consumer_key";
        case DZNPhotoPickerControllerServiceFlickr:             return @"api_key";
        case DZNPhotoPickerControllerServiceInstagram:          return @"client_id";
        case DZNPhotoPickerControllerServiceGoogleImages:       return @"key";
        case DZNPhotoPickerControllerServiceGettyImages:        return @"Api-Key";
        default:                                                return nil;
    }
}

NSString *keyPathForAPIConsumerSecret(DZNPhotoPickerControllerServices service)
{
    switch (service) {
            
        case DZNPhotoPickerControllerServiceGoogleImages:       return @"cx";
        default:                                                return nil;
    }
}

NSString *keyPathForSearchTerm(DZNPhotoPickerControllerServices service)
{
    switch (service) {
        case DZNPhotoPickerControllerService500px:              return @"term";
        case DZNPhotoPickerControllerServiceFlickr:             return @"text";
        case DZNPhotoPickerControllerServiceInstagram:          return @"q";
        case DZNPhotoPickerControllerServiceGoogleImages:       return @"q";
        case DZNPhotoPickerControllerServiceBingImages:         return @"Query";
        case DZNPhotoPickerControllerServiceGettyImages:        return @"phrase";
        default:                                                return nil;
    }
}

NSString *keyPathForSearchTag(DZNPhotoPickerControllerServices service)
{
    switch (service) {
        case DZNPhotoPickerControllerService500px:
        case DZNPhotoPickerControllerServiceFlickr:             return @"tag";
        case DZNPhotoPickerControllerServiceInstagram:          return @"q";
        case DZNPhotoPickerControllerServiceGoogleImages:       return @"q";
        default:                                                return nil;
    }
}

NSString *keyPathForSearchResultPerPage(DZNPhotoPickerControllerServices service)
{
    switch (service) {
        case DZNPhotoPickerControllerService500px:              return @"rpp";
        case DZNPhotoPickerControllerServiceFlickr:             return @"per_page";
        case DZNPhotoPickerControllerServiceGoogleImages:       return @"num";
        case DZNPhotoPickerControllerServiceGettyImages:        return @"page_size";
        default:                                                return nil;
    }
}

NSString *keyPathForSearchTagContent(DZNPhotoPickerControllerServices service)
{
    switch (service) {
        case DZNPhotoPickerControllerService500px:
        case DZNPhotoPickerControllerServiceFlickr:             return @"_content";
        case DZNPhotoPickerControllerServiceInstagram:          return @"name";
        default:                                                return nil;
    }
}

NSString *keyPathForObjectName(DZNPhotoPickerControllerServices service, NSString *objectName)
{
    if ([objectName isEqualToString:[DZNPhotoTag name]]) {
        return keyPathForTagService(service);
    }
    else if ([objectName isEqualToString:[DZNPhotoMetadata name]]) {
        return keyPathForPhotoService(service);
    }
    return nil;
}

BOOL isConsumerSecretRequiredForService(DZNPhotoPickerControllerServices services)
{
    if (services == DZNPhotoPickerControllerServiceBingImages) return NO;
    return YES;
}

BOOL isConsumerKeyInParametersRequiredForService(DZNPhotoPickerControllerServices services)
{
    if (services == DZNPhotoPickerControllerServiceBingImages || services == DZNPhotoPickerControllerServiceGettyImages) return NO;
    return YES;
}

BOOL isAuthenticationRequiredForService(DZNPhotoPickerControllerServices services)
{
    if (services == DZNPhotoPickerControllerServiceGettyImages) return YES;
    return NO;
}
