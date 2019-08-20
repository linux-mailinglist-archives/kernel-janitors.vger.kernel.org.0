Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3B80495244
	for <lists+kernel-janitors@lfdr.de>; Tue, 20 Aug 2019 02:17:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728608AbfHTARE (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Mon, 19 Aug 2019 20:17:04 -0400
Received: from mail-io1-f67.google.com ([209.85.166.67]:42812 "EHLO
        mail-io1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728578AbfHTARE (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 19 Aug 2019 20:17:04 -0400
Received: by mail-io1-f67.google.com with SMTP id e20so8327345iob.9
        for <kernel-janitors@vger.kernel.org>; Mon, 19 Aug 2019 17:17:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-language:content-transfer-encoding;
        bh=nTxRglECnRmEfEUbvLbhnxA1qZmKfNixmSHC78U1yvc=;
        b=QwxNFOyZUDfagOWtOAI4X8BFLGadKzOv3qoVjxv9WjdUozADcl2Ku7So3hPmLVlVk2
         7O/sfownr4XSwH2KOC21ucYh0COEAXN+aY2fbnvOt7ItZyQ6wiL/v0UeE7GvikpRKF65
         plwfDM8VOYaTixfrX8PJF2RTBIgTCKEMM8SX4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=nTxRglECnRmEfEUbvLbhnxA1qZmKfNixmSHC78U1yvc=;
        b=MgbG4Tef1S7YzZi0gKd+s8R9FxJZcO5jsP2BuI7kYbAm6gn/jvPyEFaxxDy5UBZe+I
         sxXijQmUi3NBSamFjKLpv6uIPn6MhsjALUj2oN8w7nju8RhdPCA9ykHJEMNHlLdn1UC5
         xAceaWy8N7IZg6AuJRMDMxaH3qJgVxovpbiyan1c+3guniKZ+im9Z8e7ikezJipwK9Ik
         TJ7JV2DEjbcxwvYfgBsHsNimNW//v/vJJVg5O8WgO6+907kwms/hUG0zlh/fQHVIX+Bo
         X0TWF9xDuM/zU3i3ev8HpF0Zdlb//o1Mq/tnBooxwUdmCvi9tOmMbZ8kgsXTk0B0vIeD
         DNXQ==
X-Gm-Message-State: APjAAAXKVtNmmC5gHL7LvPt0iciMCnmIL8+W1sKNaqhYsYQJitxI8i5J
        ljrsevny35SrvwJsdrXuA7kxxFOpUmc=
X-Google-Smtp-Source: APXvYqyNfp4Kjw+jg1hLvf40WU2jLru794eUymevTioldXyEv4NhlVAUwGjhOu7hdsG21dW0uSwopA==
X-Received: by 2002:a5d:9747:: with SMTP id c7mr15839819ioo.244.1566260223776;
        Mon, 19 Aug 2019 17:17:03 -0700 (PDT)
Received: from [192.168.1.112] (c-24-9-64-241.hsd1.co.comcast.net. [24.9.64.241])
        by smtp.gmail.com with ESMTPSA id k7sm12530367iop.88.2019.08.19.17.17.02
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 19 Aug 2019 17:17:03 -0700 (PDT)
Subject: Re: [Linux-kernel-mentees] [PROJECT] clean up swapcache use of struct
 page
To:     Matthew Wilcox <willy@infradead.org>,
        linux-kernel-mentees@lists.linuxfoundation.org, linux-mm@kvack.org,
        kernel-janitors@vger.kernel.org,
        Shuah Khan <skhan@linuxfoundation.org>
References: <20190819235456.GA9657@bombadil.infradead.org>
From:   Shuah Khan <skhan@linuxfoundation.org>
Message-ID: <f69a2e2e-ec21-efd6-4787-59f1c77885b3@linuxfoundation.org>
Date:   Mon, 19 Aug 2019 18:17:02 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190819235456.GA9657@bombadil.infradead.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Hi Matthew,

On 8/19/19 5:54 PM, Matthew Wilcox wrote:
> 
> This would be a good project for someone with a little experience and
> a lot of attention to detail.
> 
> The struct page is probably the most abused data structure in the kernel,
> and for good reason.  But some of the abuse is unnecessary ... a mere
> historical accident that would be better fixed.
> 
> Page cache pages use page->mapping and page->index to indicate which file
> the page belongs to and where in that file it is.  page->private may be
> used by the filesystem for its own purposes (eg buffer heads).
> 
> Anonymous pages use page->mapping to point to the anon VMA they belong
> to and page->index to record the offset within the VMA.  Then, if they
> are also part of the swap cache, they use page->private to record both
> the offset within the swap device and the index of the page within the
> swap device.
> 
> Then we get abominations like:
> 
> static inline pgoff_t page_index(struct page *page)
> {
>          if (unlikely(PageSwapCache(page)))
>                  return __page_file_index(page);
>          return page->index;
> }
> 
> My modest proposal for deleting the first two lines of that function is
> to first switch the uses of page->private and page->index for anonymous
> pages.  Then move the swp_type() back from page->index to page->private
> again [1].
> 
> I am willing to review patches and provide feedback.  I can go into more
> detail about how I think this should be tackled if there's interest.
> Also, if you know more than I do about the MM and think this is a bad
> idea, please do say ;-)
> 

I will be happy to add it to the project list for Spring session.

We can work together to come up with a task list to get the candidates
up to speed during the application process period which starts on Nov 1st.

> This is going to be a tough project because there are a lot of
> rarely-tested paths which directly reference (eg) page->index, and they
> might be talking about a page cache page or a swap page.  This is not
> a simple Coccinelle script.

Yes mm isn't an easy area especially for new developers. We can work
together to come up with a task list to get the candidates up to speed
during the application process period which starts on Nov 1st.

> 
> [1] We have enough bits to do this; on a 32-bit machine, we can at most
> have a VMA which covers 4GB memory and with a 4kB page size, that's only
> 20 bits needed to encode all possible offsets within a VMA).

That being said, I will wait for other mm experts weigh in.

thanks,
-- Shuah
