Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8582243CD4
	for <lists+kernel-janitors@lfdr.de>; Thu, 13 Jun 2019 17:38:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387999AbfFMPiD (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Thu, 13 Jun 2019 11:38:03 -0400
Received: from mail-qk1-f179.google.com ([209.85.222.179]:42485 "EHLO
        mail-qk1-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726519AbfFMKKM (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 13 Jun 2019 06:10:12 -0400
Received: by mail-qk1-f179.google.com with SMTP id b18so12303454qkc.9
        for <kernel-janitors@vger.kernel.org>; Thu, 13 Jun 2019 03:10:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=G+/m82mqxjd9gIpNfnWmM7e/plUww26lxwM8xYns8rs=;
        b=QlGjKHJz2GJTVK6mzm0yFP2cbnl7i+MZ4Xec/pPRbnT9GCY6XuiRDaX+gJ5XWSrcuU
         r/Hu1CyptYg6U9chTIjTCEE0D6UwpwwgZagYGIgc5djxOj9xXYoHCrDf0udxdDjrS7Xk
         o9TstvnafPjdhuXreF+benUANGH5H3n3o4tVV3PBfqEIeRdXcfFNr+36VTffGZfROpgf
         6H2gMVnOm7dyOt8j3Wg1ifrmysZdpT7crM3Um8X550quH4lDKsbf3luMiOFKb3Jmb1Fz
         T9ZqlBtKxJMGeL2M0+rmyVSP/XHiKPU/JuE8UKotyfuIvvuIn2iKjA2v6zuY2+4Fpciz
         jxGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=G+/m82mqxjd9gIpNfnWmM7e/plUww26lxwM8xYns8rs=;
        b=YhPIHUn2yyReRizuCRoxqyLxZCR4jNHs6ZQdIz5dv852U4qxL9hEubhJiv0+qtxMGk
         PtIMj3XEfttol1JmMsojtaD7/NVskI07difwO8zoGBG/qibebpXnTxxzEc1Nf+5w3+vp
         iTT88FaLSQY5NxfPtp/fGpEwGGYnnLZgWfn3XawVHAL/BSujWRByT0r5rYzopMTux1tB
         TasLii1gKHq2/WdxP/44zh6rHLCZ4NYUSWxchLxU4LjBLXr5b03zFP9V1SYG3Pyvdlbr
         tDce5oG7jjuJe9421JpNRbAZUce+/+Uze0/KMLtMKpFUpmg0O1ZCKEAzuu1VU0toFSV2
         WbPA==
X-Gm-Message-State: APjAAAUSbOz7CAWrdxmyExaGeos2VfwHTRE0fhQVZZhP+lTsE0tWMfTl
        seCfx2QeB9e6MHFKu0by4+blcQ==
X-Google-Smtp-Source: APXvYqxIbHOzxEYwBro5PMImc2reA5unpanKIDqO46BvGxrEx2OSDXZil6QC+n4Uhb/HMkmgHAcJlw==
X-Received: by 2002:ae9:e306:: with SMTP id v6mr70280179qkf.145.1560420611302;
        Thu, 13 Jun 2019 03:10:11 -0700 (PDT)
Received: from leoy-ThinkPad-X240s (li1322-146.members.linode.com. [45.79.223.146])
        by smtp.gmail.com with ESMTPSA id u125sm1190373qkd.5.2019.06.13.03.10.07
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 13 Jun 2019 03:10:10 -0700 (PDT)
Date:   Thu, 13 Jun 2019 18:10:04 +0800
From:   Leo Yan <leo.yan@linaro.org>
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Mathieu Poirier <mathieu.poirier@linaro.org>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] coresight: potential uninitialized variable in probe()
Message-ID: <20190613101004.GB5242@leoy-ThinkPad-X240s>
References: <20190613065815.GF16334@mwanda>
 <20190613074922.GB21113@leoy-ThinkPad-X240s>
 <20190613081419.GG1893@kadam>
 <20190613095637.GA5242@leoy-ThinkPad-X240s>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190613095637.GA5242@leoy-ThinkPad-X240s>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Thu, Jun 13, 2019 at 05:56:37PM +0800, Leo Yan wrote:

[...]

> > In my experience it's better to initialize the return as late as
> > possible so that you get static checker warnings when you forget to set
> > the error code.
> 
> Just want to check one thing, which static checker you are using?

Okay, I think it's smatch :)

Thanks,
Leo Yan
