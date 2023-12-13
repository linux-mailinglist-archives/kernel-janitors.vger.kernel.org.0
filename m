Return-Path: <kernel-janitors+bounces-673-lists+kernel-janitors=lfdr.de@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A462F80F7EB
	for <lists+kernel-janitors@lfdr.de>; Tue, 12 Dec 2023 21:28:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5A7431F21826
	for <lists+kernel-janitors@lfdr.de>; Tue, 12 Dec 2023 20:28:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5BF6863C1F;
	Tue, 12 Dec 2023 20:28:23 +0000 (UTC)
X-Original-To: kernel-janitors@vger.kernel.org
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BCAD2BD;
	Tue, 12 Dec 2023 12:28:19 -0800 (PST)
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-5ca29c131ebso1544842a12.0;
        Tue, 12 Dec 2023 12:28:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702412899; x=1703017699;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kHahnm6x2RByOsvkFTXG4oUFShLbTIHM8FyPM7vnGko=;
        b=njwVJjsa8uaKT859IyvqhVlkh+XVNzry8ne8nckUYBfUv1zS9XXX82NNG29qmX+FBt
         diY8ZtCrS9kaCOSdNOUTxTOy0iVhpo3OI0wkRFgIIFVt4evD7eluqskBOuyvT9io1iQ3
         c9Smd3T2c+hTvJkNx2I70SDdbLUXBahOOWisDtQ0oy+g31EW41Yd92bcfeACDgkK+BoK
         TcDFVdGnOJbX/v+5Wv/69vWYWJG23PHMmyLUHhSR+pFCghTKT6UiSP79V3pqk25vsKYB
         ZldjTBzqo4Wle518bw8eGd/cTG8vIGqGfu0jiKabJXw6qORkbi9InfPJlbbxMjvMKDOR
         xTnw==
X-Gm-Message-State: AOJu0YzFv8pgXtxEuXf8TtM+YEa6BxNxu7R906sKo4X9VJpHQ+RfgaPH
	xci+UPYZnSv7lrXEpxHA6Ms=
X-Google-Smtp-Source: AGHT+IHwWW2wNu/KT1oW0oGeYQm+Aps7+bl35OTu4MWnWM6NkNsv1RLxCYKs8PzEyHWaAf2LWpKnXg==
X-Received: by 2002:a05:6a00:c93:b0:6ce:7af1:1be2 with SMTP id a19-20020a056a000c9300b006ce7af11be2mr9792581pfv.24.1702412899091;
        Tue, 12 Dec 2023 12:28:19 -0800 (PST)
Received: from ?IPV6:2620:0:1000:5e10:c59a:35c6:9a2a:969f? ([2620:0:1000:5e10:c59a:35c6:9a2a:969f])
        by smtp.gmail.com with ESMTPSA id s16-20020a62e710000000b006cb4fa1174dsm8507795pfh.124.2023.12.12.12.28.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 Dec 2023 12:28:18 -0800 (PST)
Message-ID: <d62ef834-fc0e-4609-8cf1-754fdae209c5@acm.org>
Date: Tue, 12 Dec 2023 12:28:17 -0800
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Bart Van Assche <bvanassche@acm.org>
Subject: Re: [PATCH 1/2] scsi: myrb: Fix a potential string truncation in
 rebuild_show()
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>, hare@kernel.org,
 jejb@linux.ibm.com, martin.petersen@oracle.com
Cc: hare@suse.com, linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org,
 kernel-janitors@vger.kernel.org
References: <cover.1702411083.git.christophe.jaillet@wanadoo.fr>
 <2d3096dd4b1b6e758287e4062e3147c57c007eaa.1702411083.git.christophe.jaillet@wanadoo.fr>
 <dac24fac-57eb-4ca8-b819-fbdc24464d94@acm.org>
 <70b7e97b-2044-4515-aadc-87d202d32b93@wanadoo.fr>
Content-Language: en-US
In-Reply-To: <70b7e97b-2044-4515-aadc-87d202d32b93@wanadoo.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12/12/23 10:20, Christophe JAILLET wrote:
> In this case, do you still prefer 2 patches (one to fix
> rebuild_show() and one for all the other _show function) or only 1
> with everything in it?
One patch with all the changes is probably better.

Thanks,

Bart.


