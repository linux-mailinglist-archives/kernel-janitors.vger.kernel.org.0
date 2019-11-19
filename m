Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E801A10285E
	for <lists+kernel-janitors@lfdr.de>; Tue, 19 Nov 2019 16:45:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728375AbfKSPpc (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Tue, 19 Nov 2019 10:45:32 -0500
Received: from mail-io1-f66.google.com ([209.85.166.66]:45780 "EHLO
        mail-io1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728336AbfKSPpa (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 19 Nov 2019 10:45:30 -0500
Received: by mail-io1-f66.google.com with SMTP id v17so12577455iol.12
        for <kernel-janitors@vger.kernel.org>; Tue, 19 Nov 2019 07:45:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=ILms/bB5JEtUXlffrq/EMHXcgXCQzsaG2M1qIBlKUaQ=;
        b=RwBME2OoqBztOI11Voq+RBDUpPBLExkw/VYGbmu1VlblBKOGHqNeO5L6Xz3qvALBPm
         HuOxueoQr47BxFCKxsxDLxuGY0n6u1XaRW+BP/AinVTaQCRqOv9pAcv+i4LLlefza6ys
         Mv829/6Gga0idOLiQo6yiK6DA35AzyH39OfCt/Mpl6b69udOzBI+266SvHciziY0ooTv
         gEkuD4zAx32J4Bjif1LvH5kbNk2cKV+bjd0PMIkw/p4J/dmZ/aI0ar+8YWjNRCwMAcg4
         PNnjDOv8HO+PWtQRtuQcJ3CVZ67QzJWtgNUY9Sh0Hg7WJBXdJ6n3iRhFDcyag4vDZPNU
         hoqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=ILms/bB5JEtUXlffrq/EMHXcgXCQzsaG2M1qIBlKUaQ=;
        b=CMo1QiCEhBOxhJSxtoCvzbF7UD+p7LZF1vpgsQqm9MkblJvE+0UI4fyJjJWL5fGARq
         XAp9tlx0tdAT8Xay1547tI81eehOfvD1qXhqkIEZp0ZnKX2ZGQzf+nPNOQKijqZJmMz5
         Wb+BAqmaRfUJmxG1VBg1dA9zdtXFDfEnoVX8LXoCyihbHlru0XMqbc+3XcBRIaDNpnW+
         R6k0PBQufqyuO2GiFlHSLAdVdP4MRb6BuBuhnLcLOieLnptK+F6w5ounRH1hhZFnAqrB
         7mRG90jDDsdjsRjwa5cFMNj8+CLq2KVdWd1ZgLqWoiR74iq04zSJnW5kipStyQ1xHL0m
         8H/Q==
X-Gm-Message-State: APjAAAVdAV2MI4xOXltPAhObf/Ci9Kdp5Ca6FyJlbL6kZ6Nq2Dly8F0L
        jIRY0a28O+uoSgx8b/vc23CSn/F/gMc=
X-Google-Smtp-Source: APXvYqznPJlg+TnJQNzJlFLlkHhxBEEmh+lvMVKVsCOsZH+6WUZXKFc57WfrzoCx/y5oaecfPWPWwQ==
X-Received: by 2002:a6b:400d:: with SMTP id k13mr19027339ioa.299.1574178328024;
        Tue, 19 Nov 2019 07:45:28 -0800 (PST)
Received: from [192.168.1.159] ([65.144.74.34])
        by smtp.gmail.com with ESMTPSA id s18sm5604075ilo.21.2019.11.19.07.45.26
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 19 Nov 2019 07:45:26 -0800 (PST)
Subject: Re: [PATCH] io-wq: remove extra space characters
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Alexander Viro <viro@zeniv.linux.org.uk>, io-uring@vger.kernel.org,
        linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org
References: <20191119062216.qhxmnrt2rdioirja@kili.mountain>
From:   Jens Axboe <axboe@kernel.dk>
Message-ID: <ac841162-db41-0c8b-6ff8-d5b956961582@kernel.dk>
Date:   Tue, 19 Nov 2019 08:45:25 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191119062216.qhxmnrt2rdioirja@kili.mountain>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On 11/18/19 11:22 PM, Dan Carpenter wrote:
> These lines are indented an extra space character.

Thanks, applied.

> We often see this where the lines after a comment are indented one
> space extra.  I don't know if it's an editor thing maybe?

I think I can explain that. I recently decided to try and use the
vim auto-indent, to see if it'd make my life a little easier to
save on typing. Unfortunately it has a bug where it indents that
extra space following a comment form like:

/*
 * bla bla
 */

which is exactly what happened here. As diff doesn't show that
as extra whitespace you can miss that it happened.

-- 
Jens Axboe

