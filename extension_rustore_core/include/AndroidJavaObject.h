#pragma once

#include <dmsdk/sdk.h>

#if defined(DM_PLATFORM_ANDROID)

#include <dmsdk/dlib/android.h>

namespace RuStoreSDK
{
	class AndroidJavaObject
	{
		public:
		jclass cls;
		jobject obj;

		AndroidJavaObject();
		void Free(JNIEnv* env);
	};
}

#endif
