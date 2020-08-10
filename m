Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B9A9F2411CE
	for <lists+kernel-janitors@lfdr.de>; Mon, 10 Aug 2020 22:36:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726690AbgHJUgd (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Mon, 10 Aug 2020 16:36:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55274 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726505AbgHJUgd (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 10 Aug 2020 16:36:33 -0400
Received: from mail-ot1-x341.google.com (mail-ot1-x341.google.com [IPv6:2607:f8b0:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 36B44C061788
        for <kernel-janitors@vger.kernel.org>; Mon, 10 Aug 2020 13:36:33 -0700 (PDT)
Received: by mail-ot1-x341.google.com with SMTP id v21so8359330otj.9
        for <kernel-janitors@vger.kernel.org>; Mon, 10 Aug 2020 13:36:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=HI5lYobBh5RFongYBHy3SxRT7R6Q8746klJDIeOy6qU=;
        b=EA9XWL8ixJer6vvD9QKB92A7snrHrW1lP9KMNfKkrgDRKIm/boc70yBjqb5A3P6THW
         /0DCP7NdG1s9AnFnaRyiNofaz8s8jhbkPYjsQ3hXZhmCDlofEAtyAneovWP2IwR8Us+D
         cQHMHQGIzZj+AzPMHLwf8Vk6dSvpz/3omoDMU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=HI5lYobBh5RFongYBHy3SxRT7R6Q8746klJDIeOy6qU=;
        b=JsWi5vzPRBN37uTr5VDnuFZP3AQbn0g4ZZzQrotNHthFPntUo2Le5ew3Mex+voU266
         J+DLmTmAsp6yqP840HOmAB6ETWXfpj/YzaZ+wlaijZiSJazNiX7cw8iaOWp40Jes/KAK
         RNJA2ytdlUlPvjWRIzauYUKZCmTCbQivaOSIvuAywOkbC+6gP6zNcsuu0fuipX8vXTrh
         zj3PU+o8OZQu9Bw3a/KMtoui12otVcad7lCkbe+bCM33cfsPa66wwPRD8bsIx6bbqPNV
         b5YkhDuOo9NAP3sy6wZlesSjx863BXizGqXyE1QW+0QyHRSR6nlO8v2ItiBV5a6OLD80
         YloA==
X-Gm-Message-State: AOAM532iCpiK0zTDaA2ITtkiFGT9e6n6ODbbTmiTrtS+9KwGuzstP34u
        XDjre1TSlZqeRpC/r/MhUHEF9w==
X-Google-Smtp-Source: ABdhPJwyXOGud5mnCnLyYllZBzTKdtqelYBxOZV4q9EeZkRhIBCLgeDowbbDa/iwkcMiZ05qI2Yvlg==
X-Received: by 2002:a9d:6d1a:: with SMTP id o26mr2140683otp.84.1597091791948;
        Mon, 10 Aug 2020 13:36:31 -0700 (PDT)
Received: from [192.168.1.112] (c-24-9-64-241.hsd1.co.comcast.net. [24.9.64.241])
        by smtp.gmail.com with ESMTPSA id b10sm673545oiy.7.2020.08.10.13.36.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Aug 2020 13:36:31 -0700 (PDT)
Subject: Re: [PATCH] cpupowerutils: fix spelling mistake "dependant" ->
 "dependent"
To:     Colin King <colin.king@canonical.com>,
        Thomas Renninger <trenn@suse.com>,
        Shuah Khan <shuah@kernel.org>, linux-pm@vger.kernel.org
Cc:     kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
        "Rafael J. Wysocki" <rafael@kernel.org>, skhan@linuxfoundation.org
References: <20200810102115.62405-1-colin.king@canonical.com>
From:   Shuah Khan <skhan@linuxfoundation.org>
Message-ID: <72e1bc33-5ac1-5719-196c-a9d8f265fbff@linuxfoundation.org>
Date:   Mon, 10 Aug 2020 14:36:30 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200810102115.62405-1-colin.king@canonical.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On 8/10/20 4:21 AM, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> There is a spelling mistake in a message. Fix it.
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>   tools/power/cpupower/debug/i386/intel_gsic.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tools/power/cpupower/debug/i386/intel_gsic.c b/tools/power/cpupower/debug/i386/intel_gsic.c
> index e5e926f46d6b..befd837f07f8 100644
> --- a/tools/power/cpupower/debug/i386/intel_gsic.c
> +++ b/tools/power/cpupower/debug/i386/intel_gsic.c
> @@ -71,7 +71,7 @@ int main (void)
>   		printf("\tsmi_cmd=0x?? smi_port=0x?? smi_sig=1\n");
>   		printf("\nUnfortunately, you have to know what exactly are "
>   		       "smi_cmd and smi_port, and this\nis system "
> -		       "dependant.\n");
> +		       "dependent.\n");
>   	}
>   	return 1;
>   }
> 

Thanks for the patch. Applied to 
git://git.kernel.org/pub/scm/linux/kernel/git/shuah/linux.git cpupower 
branch and will be included in
  my next pull request to Rafael.

thanks,
-- Shuah
