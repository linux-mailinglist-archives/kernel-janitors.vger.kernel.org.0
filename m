Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0B178866B0
	for <lists+kernel-janitors@lfdr.de>; Thu,  8 Aug 2019 18:10:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404120AbfHHQKB (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Thu, 8 Aug 2019 12:10:01 -0400
Received: from mail-pl1-f193.google.com ([209.85.214.193]:39599 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732662AbfHHQKB (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 8 Aug 2019 12:10:01 -0400
Received: by mail-pl1-f193.google.com with SMTP id b7so43789923pls.6;
        Thu, 08 Aug 2019 09:10:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=akVDmQLmyHVu/cQZFdUEQUlBMCsxiv2Zb1QwNgfTWp0=;
        b=pvcFYY1Od9wReDUvHuU8dmSpig5/HjS1DYUd9dxkg8D21MWHGHWIqw+16Ce4JkZbxx
         gBS9D1Tk8YZRyJbRl6J5wuteVd96GPqFNBoWzNtCDrBwEYTeYjRWcHu6gTRjKQj4gOc9
         cOUycclyocPZLYfOw6j7GvYD4yJ0IrD4JtJfQ8GMhOw9BBDcNYVjmW8GvSuyJgQ8RZv+
         /HJzN3Fe8VfDHQygWOGIe7NaxoExcqqDXs3aCn89Brou1gceCZmXrii+flx01ahASWzG
         w81fdGupsOx3VVT6KbxY1s1ZMNmBe9WjxoVKpDT4ZABQOk0rVvdmgKvIyCgAVWtiIfc+
         pb+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=akVDmQLmyHVu/cQZFdUEQUlBMCsxiv2Zb1QwNgfTWp0=;
        b=ngKDj6DrQVJlCY6hdejY4i3I6xW3VRLBd2pN1mf/Ayg3EUJvTl9IzoMvnHNKZZLg2H
         uSjHqYg1Sr3WFuG5RWkkgnYKsvo7owUGw66eBFKVAQJAM6zMYAgc5T6CtGH8EXMpMxF8
         1T3dCLhqitFzI/Wx/070Zu8b7GsTgmZEWvYk1GNF7CQ9f2UatxngxowT7/+Wz7KVXkGq
         +5uK30j2S+ypxYsIxBU1VbMLHVQZVdP9cUDTcqsR8i0YL2CGgSBdov2rheP2IJoDSGfR
         r0Z4nIpJp1EN89+huTuAu8zLWnJ1a+NgwKErLgo6LYACSFjZiCy5I3TRo5litaR97MOv
         f9vA==
X-Gm-Message-State: APjAAAXipt4VF5MJyu3ymnD19+Hvh932L2Oy1pDRixOA8UA9VhH6HJgh
        +W9JukHR5iO3npBh52l1bM4=
X-Google-Smtp-Source: APXvYqzto2FY24twGWc6FKcHSuYLjATrFTxhX5jDOiNLzoC7sG+UZke5aXwynrLm9PvF9kqjrWjWWg==
X-Received: by 2002:a17:902:5985:: with SMTP id p5mr14295703pli.177.1565280600398;
        Thu, 08 Aug 2019 09:10:00 -0700 (PDT)
Received: from [192.168.1.70] (c-73-231-235-122.hsd1.ca.comcast.net. [73.231.235.122])
        by smtp.gmail.com with ESMTPSA id g2sm115493792pfb.95.2019.08.08.09.09.59
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 08 Aug 2019 09:09:59 -0700 (PDT)
Subject: Re: [PATCH] of/platform: Clean up a return type in of_link_property()
To:     Dan Carpenter <dan.carpenter@oracle.com>,
        Rob Herring <robh+dt@kernel.org>,
        Saravana Kannan <saravanak@google.com>
Cc:     Anton Vorontsov <anton@enomsg.org>,
        Colin Cross <ccross@android.com>,
        Tony Luck <tony.luck@intel.com>, devicetree@vger.kernel.org,
        kernel-janitors@vger.kernel.org
References: <20190808103207.GA30506@mwanda>
From:   Frank Rowand <frowand.list@gmail.com>
Message-ID: <b5afe4e9-db49-f50c-eb03-5d300a72e88b@gmail.com>
Date:   Thu, 8 Aug 2019 09:09:58 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190808103207.GA30506@mwanda>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On 8/8/19 3:32 AM, Dan Carpenter wrote:
> This function is supposed to return zero on success and negative
> error codes on failure but currently it returns true on failure.  The
> caller only checks for zero and non-zero so this mixup doesn't cause any
> runtime issues.
> 
> Fixes: 690ff7881b26 ("of/platform: Add functional dependency link from DT bindings")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
>  drivers/of/platform.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/of/platform.c b/drivers/of/platform.c
> index 21838226d68a..86fb8ab8c012 100644
> --- a/drivers/of/platform.c
> +++ b/drivers/of/platform.c
> @@ -625,7 +625,7 @@ static const struct supplier_bindings bindings[] = {
>  	{ },
>  };
>  
> -static bool of_link_property(struct device *dev, struct device_node *con_np,
> +static int of_link_property(struct device *dev, struct device_node *con_np,
>  			     const char *prop)
>  {
>  	struct device_node *phandle;
> 

Hi Dan,


Thanks for catching this.

Another patch was submitted to fix this just before your patch.

-Frank
