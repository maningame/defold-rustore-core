#pragma once

#include <dmsdk/sdk.h>
#include <vector>
#include <mutex>
#include <memory>
#include <string>

namespace RuStoreSDK
{
	struct ChannelCallbackItem
	{
		const std::string channel;
		dmScript::LuaCallbackInfo* callback;

		ChannelCallbackItem(const char* ch, dmScript::LuaCallbackInfo* cb) : channel(ch), callback(cb) {}
	};

	class ChannelCallbackManager
	{
		private:
		std::mutex _mutex;
		std::vector<std::shared_ptr<ChannelCallbackItem>> _callbacks;

		public:
		void AddChannelCallback(std::shared_ptr<ChannelCallbackItem> item);
		std::vector<dmScript::LuaCallbackInfo*> FindLuaCallbacksByChannel(const char* channel);
		void Clear();

		static ChannelCallbackManager* Instance();
	};
}
