Return-Path: <kernel-janitors+bounces-4880-lists+kernel-janitors=lfdr.de@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F4429420EE
	for <lists+kernel-janitors@lfdr.de>; Tue, 30 Jul 2024 21:46:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CD8A3B25C7B
	for <lists+kernel-janitors@lfdr.de>; Tue, 30 Jul 2024 19:46:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F401518C91A;
	Tue, 30 Jul 2024 19:45:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="pVcbwrTE"
X-Original-To: kernel-janitors@vger.kernel.org
Received: from mail-oa1-f52.google.com (mail-oa1-f52.google.com [209.85.160.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9314149C41
	for <kernel-janitors@vger.kernel.org>; Tue, 30 Jul 2024 19:45:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722368723; cv=none; b=JlqSdFOjyMJOtsNWHt9FB8WDC0bGtqKEQCty9iL/dMfcudFPm/1l8XTa30SXZ77V5mKj1mLu7EJ9AkFqEWEIz1AHwRCw5YcVp1SzRhcGxo7uVNFwzQitEuCZwpRq7WeUYakGQhFYNJWhP7+RFMd41TYV8X4MpZQ6ysoS7gtb49Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722368723; c=relaxed/simple;
	bh=UcK3WRlI0i4AnQJ9pSrUXzwWKukbD9tHc8II/d6bZzA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=JOg7pr5UQIRtynWtEn8Ql8R7Mx2/PIwLtTjdD1oqKt1x413OR8ZwIMW8dseR6rk0jBgTqvmnq03B85xxYUuXTvXDbSOvxAiWtXDApnEj8xX0AbAwTlFmNlHe96YbiFWa0tdWxKewQfqBR7DqVBxZx3UWUAGnb7607cxsLzZPgJs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=pVcbwrTE; arc=none smtp.client-ip=209.85.160.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-oa1-f52.google.com with SMTP id 586e51a60fabf-250ca14422aso3075244fac.0
        for <kernel-janitors@vger.kernel.org>; Tue, 30 Jul 2024 12:45:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1722368721; x=1722973521; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=f+5Aj8SCfvE1zeHW26c6iQLjsZV5z+GWwDvq7F2AI6I=;
        b=pVcbwrTE7JsGb0wlFpv3OAITi7QqxaN2usALeiHWgJ4P2FxZ5xUGd1tRNf4tAh81Mm
         2Ux5k6x1LPfrJhRN5shoLp8qQF+AePnzDl55dB17B3WAeNmkXrnq6C2txnrmfqHhg2+5
         PWSrGtBzQjk2OnYLjWi0tyFYAgvg21J/CaC3LyTXc+AoZmq5tCPmid8avFvRykN75JeL
         SNIegFCB3g1N+R9MpJ2eECGHNDK9j0NTr9ioIo26I7QafR6tTfjg6+CoNm+qVVrtEWX6
         4FNpgibb0yYmKpyf++kNomIJb28TySvezkAl5bSROQ7n7ATqKD5gjPRlNl2hSkNwix0r
         FzHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722368721; x=1722973521;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=f+5Aj8SCfvE1zeHW26c6iQLjsZV5z+GWwDvq7F2AI6I=;
        b=XGkpteE9CEXongrvkL+CzRdnmYkkf7ar+wrX3CG7jT0uivdgTuVkFGwfkMT35F0mlb
         4XRIus86Y1U9nMgRT5ra9D2rmPw427+K4x68uhAiKR8QKMZxw/lh1K+3iGg0sYKFF548
         lKOFEh7kDRNTlcCukUHhwG0YFuTF62bY/Gtal0hQVuY73p2TpBuQpbtTxahpaO76c3di
         kwnCLedwlR3iJNh8hRbVA7ZrA/5IZlVyydgwUIokzUYTtBH8vzoY43tMEapzoONzZSVh
         LvWrOHBRho87r5DVm9mKk16cGPxOCCMQ1o5A6Vu+yFDACV3nVnwFVaiiyds0bNh38NxX
         IokA==
X-Forwarded-Encrypted: i=1; AJvYcCVuWPMzPNRA7U8atp1aKjUBBN5jxE92w8tZO7wLHMzbJ3Y43/qEMHUE4fE/Lc4yf9rKoEp+tVF5dKXcZn1IBSO4WdCXUK+ecPk+TthVSna+
X-Gm-Message-State: AOJu0Yx3q/Kguq+7NfNukvkrCm/qzFyV8ssjdwmSqpZwmSlE/p28MlRr
	7sSTwwbzer64FJLYocQujpK0QB79lPmPbq8dHTfCGW2catgAH4vGYV11o12lnJk=
X-Google-Smtp-Source: AGHT+IHGHNiVGOsJuZvFvPQqV62LAjNj0qwTjdE8VDum/d31n/ETMCp8UvHFjHW5/VHEtXB8map6LQ==
X-Received: by 2002:a05:6870:37ce:b0:260:ff24:fb32 with SMTP id 586e51a60fabf-267d4d1475amr14597124fac.1.1722368720869;
        Tue, 30 Jul 2024 12:45:20 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700::1cb1])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-2653de2bc99sm2344485fac.10.2024.07.30.12.45.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jul 2024 12:45:20 -0700 (PDT)
Date: Tue, 30 Jul 2024 14:45:17 -0500
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: linux-bcachefs@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [bug report] bcachefs: Kill opts.buckets_nouse
Message-ID: <31ed13c7-7a14-4693-a9cc-fdb078a3c412@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello Kent Overstreet,

Commit ffcbec607613 ("bcachefs: Kill opts.buckets_nouse") from Apr 6,
2024 (linux-next), leads to the following Smatch static checker
warning:

	fs/bcachefs/super.c:1202 bch2_dev_free()
	warn: 'ca->buckets_nouse' double freed

fs/bcachefs/super.c
    1185 static void bch2_dev_free(struct bch_dev *ca)
    1186 {
    1187         cancel_work_sync(&ca->io_error_work);
    1188 
    1189         if (ca->kobj.state_in_sysfs &&
    1190             ca->disk_sb.bdev)
    1191                 sysfs_remove_link(bdev_kobj(ca->disk_sb.bdev), "bcachefs");
    1192 
    1193         if (ca->kobj.state_in_sysfs)
    1194                 kobject_del(&ca->kobj);
    1195 
    1196         kfree(ca->buckets_nouse);
                       ^^^^^^^^^^^^^^^^^
The patch adds a free

    1197         bch2_free_super(&ca->disk_sb);
    1198         bch2_dev_allocator_background_exit(ca);
    1199         bch2_dev_journal_exit(ca);
    1200 
    1201         free_percpu(ca->io_done);
--> 1202         bch2_dev_buckets_free(ca);
                                       ^^
The existing code already freed ca->buckets_nouse.

    1203         free_page((unsigned long) ca->sb_read_scratch);
    1204 
    1205         bch2_time_stats_quantiles_exit(&ca->io_latency[WRITE]);
    1206         bch2_time_stats_quantiles_exit(&ca->io_latency[READ]);
    1207 
    1208         percpu_ref_exit(&ca->io_ref);
    1209 #ifndef CONFIG_BCACHEFS_DEBUG
    1210         percpu_ref_exit(&ca->ref);
    1211 #endif
    1212         kobject_put(&ca->kobj);

regards,
dan carpenter

