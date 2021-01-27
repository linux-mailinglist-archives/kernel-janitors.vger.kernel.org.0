Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7AFEA30613E
	for <lists+kernel-janitors@lfdr.de>; Wed, 27 Jan 2021 17:48:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231352AbhA0Qs0 (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Wed, 27 Jan 2021 11:48:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46168 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232348AbhA0Qr7 (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 27 Jan 2021 11:47:59 -0500
Received: from mail-ot1-x333.google.com (mail-ot1-x333.google.com [IPv6:2607:f8b0:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7BDF4C061573;
        Wed, 27 Jan 2021 08:47:19 -0800 (PST)
Received: by mail-ot1-x333.google.com with SMTP id i30so2296509ota.6;
        Wed, 27 Jan 2021 08:47:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=t6uTcRB+VXkCIz3lATiC5ggdGg++l8XBk0JLBAVQyRQ=;
        b=fCW6mx9zEt2P86ZIqjIsfJcDC1V4MfMEZyirQNvF2vL1kz3lJUWtTGd8TUDd7hakp8
         k32c6iRH8RPNgnYa75OBVDpqZANTvlys+z1EG4hKaTCWruNFx/tAZ7fC8uDoDZ8B5IYx
         xkGSeP9dyiTpCI8lE8s/T0/alGi180d7s3omYCcS0G0kUcEhce1MJl/Q5qq/H2pnsful
         CjP4xDV7KlVd1sdtqZof84gg6Q0oFB0NKe5m4XlLZfUqmgJnwQSYgoYoh06kruXjZDl+
         UUqIVADrPqcbNYW0UdEn4gkf7KY4ruQ3LDUGnqck3ixESYsaXbjawfI73+tLXVPI1iz9
         iH2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=t6uTcRB+VXkCIz3lATiC5ggdGg++l8XBk0JLBAVQyRQ=;
        b=uibVIV2Mg3OLNQnGUlrcniBYGde5Qsb+k/9c5E58bk63ng2tUUoKcOsggNjijKu09q
         +HzZcY7cRd8S9PaSQtTby0f+Em5V7VYa0hNFzbpqDfMM7ANhrN1WJgsTwenSTnItvXnB
         F15LgimZPPzQ+Dzmagi6Z974TWef1wYUGgjgyJ3BeY0Z46UTvh9eOjzWfU1R32HmUhh2
         ixglDrwCeZ1mfgf8YQ7iI/jZBHU3SieFBujVyazCIqJfMxtIRSScDwTrrEKTNCbA5pcm
         mXusqZs2x2RbRwsnRHcXXhGSFH52a98vvkqcWOFr2WuzHvOkfjBvvCe48rA8213eNsjQ
         JBvw==
X-Gm-Message-State: AOAM532wLrSMduV9k+Sy0sS+sZH7+J8k8OvF3zh7F/ysiVs6T9AsoMCx
        gxbLUoiVP8k78+GM7Uj01hY=
X-Google-Smtp-Source: ABdhPJzKG5KnvSNuCkZXm21/QqAzF/JQysiApHzQFt10KML1H/pgvR8MPsys8PnMbxu5Dcc53D7EsA==
X-Received: by 2002:a9d:748a:: with SMTP id t10mr8321054otk.336.1611766038922;
        Wed, 27 Jan 2021 08:47:18 -0800 (PST)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id k20sm447650otr.34.2021.01.27.08.47.17
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 27 Jan 2021 08:47:18 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Wed, 27 Jan 2021 08:47:16 -0800
From:   Guenter Roeck <linux@roeck-us.net>
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Jean Delvare <jdelvare@suse.com>,
        Johannes Cornelis Draaijer <jcdra1@gmail.com>,
        linux-hwmon@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] hwmon: (aht10) Unlock on error in aht10_read_values()
Message-ID: <20210127164716.GA144600@roeck-us.net>
References: <YBD5Ro549hMJSnW4@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YBD5Ro549hMJSnW4@mwanda>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Wed, Jan 27, 2021 at 08:25:26AM +0300, Dan Carpenter wrote:
> This error path needs to drop the lock before returning.
> 
> Fixes: afd018716398 ("hwmon: Add AHT10 Temperature and Humidity Sensor Driver")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Applied.

Thanks,
Guenter
